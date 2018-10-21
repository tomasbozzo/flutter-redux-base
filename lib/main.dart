import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_base_app/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_base_app/redux/reducers.dart';

void main() {
  final store = new Store<int>(clickReducer, initialState: 0);

  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<int> store;

  const MyApp({Key key, this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new MyHomePage(
            title: 'Flutter Demo Home Page',
            store: store,
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Store<int> store;

  const MyHomePage({Key key, this.title, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new StoreConnector<int, int>(
                converter: (store) => store.state,
                builder: (context, counter) {
                  return new Text(
                    counter.toString(),
                    style: Theme.of(context).textTheme.display1
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => store.dispatch(new ClickAction()),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
