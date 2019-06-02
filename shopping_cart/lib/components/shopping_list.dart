import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/components/shopping_list_item.dart';
import 'package:shopping_cart/models/cart_item.dart';
import 'package:shopping_cart/store/store.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, Object>>(
      converter: (store) => {'items': getCartItemsSorted(store.state.cartItems), 'store': store},
      builder: (context, payload) {
        return ListView.builder(
          itemCount: (payload['store'] as Store<AppState>).state.cartItems.length,
          itemBuilder: (context, position) =>
              ShoppingListItem((payload['items'] as List<CartItem>)[position], payload['store'] as Store<AppState>),
        );
      },
    );
  }
}
