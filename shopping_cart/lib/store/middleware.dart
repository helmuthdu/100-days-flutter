import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'store.dart';

const String APP_STATE_KEY = "APP_STATE";

void storeCartItemsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is AddItemAction || action is ToggleItemStateAction || action is RemoveItemAction) {
    saveStateToPrefs(store.state);
  }

  if (action is FetchItemsAction) {
    loadStateFromPrefs().then((state) {
      store.dispatch(ItemLoadedAction(state.cartItems));
    });
  }

  next(action);
}

void saveStateToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = json.encode(state.toJson());
  await preferences.setString(APP_STATE_KEY, stateString);
}

Future<AppState> loadStateFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = preferences.getString(APP_STATE_KEY);
  Map stateMap = jsonDecode(stateString) ?? {};
  return AppState.fromJson(stateMap);
}
