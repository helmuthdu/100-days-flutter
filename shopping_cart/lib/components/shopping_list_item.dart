import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart/models/cart_item.dart';
import 'package:shopping_cart/store/store.dart';

class ShoppingListItem extends StatelessWidget {
  final CartItem item;

  ShoppingListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      leading: StoreConnector<AppState, OnStateChanged>(converter: (store) {
        return (item) => store.dispatch(ToggleItemStateAction(item));
      }, builder: (context, callback) {
        return Checkbox(
            value: item.completed,
            onChanged: (bool newValue) {
              callback(CartItem(item.name, newValue));
            });
      }),
      trailing: StoreConnector<AppState, OnRemoveIconClicked>(
        converter: (store) {
          return (item) => store.dispatch(RemoveItemAction(item));
        },
        builder: (context, callback) {
          return IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              callback(CartItem(item.name, item.completed));
            },
          );
        },
      ),
    );
  }
}

typedef OnStateChanged = Function(CartItem item);

typedef OnRemoveIconClicked = Function(CartItem item);
