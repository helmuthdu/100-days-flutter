import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/pages/shopping_list.dart';
import 'package:shopping_cart/store/store.dart';

import 'components/add_item_dialog.dart';

class App extends StatelessWidget {
  final store = Store<AppState>(appStateReducers,
      initialState: AppState.empty, middleware: [storeCartItemsMiddleware]);

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
            onInit: (store) => store.dispatch(FetchItemsAction()),
            builder: (context, store) => ShoppingCart(store)),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  Store<AppState> store;

  ShoppingCart(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingList'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
