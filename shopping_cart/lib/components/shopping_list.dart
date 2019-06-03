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
      converter: (store) => {'items': itemsSortedSelector(store.state), 'store': store},
      builder: (context, payload) {
        List<CartItem> items = payload['items'];
        Store<AppState> store = payload['store'];

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, position) =>
              ShoppingListItem(items[position], store),
        );
      },
    );
  }
}
