import 'package:flutter_redux_base_app/redux/actions.dart';

int clickReducer(int item, dynamic action) {
  if (action is ClickAction) {
    return item + 1;
  }

  return item;
}