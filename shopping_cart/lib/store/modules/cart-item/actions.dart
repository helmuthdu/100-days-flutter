import 'package:shopping_cart/models/cart_item.dart';

class FetchItemsAction {}

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);

  @override
  String toString() {
    return 'AddItemAction{item: $item}';
  }
}

class ToggleItemStateAction {
  final CartItem item;

  ToggleItemStateAction(this.item);

  @override
  String toString() {
    return 'ToggleItemStateAction{item: $item}';
  }
}

class ItemLoadedAction {
  final List<CartItem> items;

  ItemLoadedAction(this.items);

  @override
  String toString() {
    return 'ItemLoadedAction{items: $items}';
  }
}

class RemoveItemAction {
  final CartItem item;

  RemoveItemAction(this.item);

  @override
  String toString() {
    return 'RemoveItemAction{item: $item}';
  }
}
