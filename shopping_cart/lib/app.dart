import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/pages/shopping.dart';
import 'package:shopping_cart/store/store.dart';

class App extends StatelessWidget {
  final store = Store<AppState>(appStateReducers, initialState: AppState.empty, middleware: setupMiddleware());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'ShoppingList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(FetchItemsAction()), builder: (context, store) => ShoppingCart(store)),
      ),
    );
  }
}
