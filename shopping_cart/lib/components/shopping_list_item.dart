import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/models/cart_item.dart';
import 'package:shopping_cart/store/store.dart';

typedef OnStateChanged = Function(CartItem item);

typedef OnRemoveIconClicked = Function(CartItem item);

class ShoppingListItem extends StatelessWidget {
  final CartItem item;

  final Store<AppState> store;

  ShoppingListItem(this.item, this.store);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          _deleteItem();
          _buildOnDeleteSnackBar(context);
        } else {
          _deleteItem();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("${item.name} snoozed"),
          ));
        }
      },
      background: Container(
        color: Colors.orange,
        child: ListTile(
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.timer),
            onPressed: () {},
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: ListTile(
          trailing: IconButton(
            color: Colors.white,
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
      child: ListTile(
        title: Text(item.name),
        leading: Checkbox(
            value: item.completed,
            onChanged: (bool completed) {
              _toggleItem(completed);
            }),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _deleteItem();
            _buildOnDeleteSnackBar(context);
          },
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _buildOnDeleteSnackBar(BuildContext context) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("${item.name} removed"),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () => _restoreItem(),
      ),
    ));
  }

  void _restoreItem() {
    store.dispatch(AddItemAction(item));
  }

  void _deleteItem() =>
      store.dispatch(RemoveItemAction(item));

  void _toggleItem(bool completed) =>
      store.dispatch(ToggleItemStateAction(item.copyWith(completed: completed)));
}
