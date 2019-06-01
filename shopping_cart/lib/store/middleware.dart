import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/cart_item/actions.dart';
import 'state.dart';

const String APP_STATE_KEY = "APP_STATE";

List<Middleware<AppState>> setupMiddleware() {
  final saveState = saveStateToPrefs();
  final loadState = loadStateFromPrefs();

  return [
    TypedMiddleware<AppState, FetchItemsAction>(loadState),
    TypedMiddleware<AppState, ToggleItemStateAction>(saveState),
    TypedMiddleware<AppState, RemoveItemAction>(saveState),
    TypedMiddleware<AppState, AddItemAction>(saveState),
  ];
}

Middleware<AppState> saveStateToPrefs() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stateString = json.encode(store.state.toJson());
    await preferences.setString(APP_STATE_KEY, stateString);
    print(stateString);

    next(action);
  };
}

Middleware<AppState> loadStateFromPrefs() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stateString = preferences.getString(APP_STATE_KEY);

    if (stateString != null) {
      Map<String, dynamic> stateMap = jsonDecode(stateString);
      store.dispatch(ItemLoadedAction(AppState.fromJson(stateMap).cartItems));
    }

    next(action);
  };
}
