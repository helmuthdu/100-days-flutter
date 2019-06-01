import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/components/shopping_list_item.dart';
import 'package:shopping_cart/store/state.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (context, store) {
        return ListView.builder(
          itemCount: store.state.cartItems.length,
          itemBuilder: (context, position) => ShoppingListItem(store.state.cartItems[position], store),
        );
      },
    );
  }
}
