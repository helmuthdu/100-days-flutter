import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/models/cart_item.dart';
import 'package:shopping_cart/components/shopping_list_item.dart';
import 'package:shopping_cart/store/state.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<CartItem>>(
      converter: (store) => store.state.cartItems,
      builder: (context, list) {
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) => ShoppingListItem(list[position]),
        );
      },
    );
  }
}
