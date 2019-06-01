import 'package:redux/redux.dart';
import 'package:shopping_cart/models/cart_item.dart';

import 'actions.dart';

final cartItemReducers = combineReducers<List<CartItem>>([
  TypedReducer<List<CartItem>, ItemLoadedAction>(_loadItems),
  TypedReducer<List<CartItem>, AddItemAction>(_addItem),
  TypedReducer<List<CartItem>, ToggleItemStateAction>(_toggleItemState),
  TypedReducer<List<CartItem>, RemoveItemAction>(_removeItem),
]);

List<CartItem> _addItem(List<CartItem> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<CartItem> _toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return items.map((item) => item.name == action.item.name ? action.item : item).toList();
}

List<CartItem> _removeItem(List<CartItem> items, RemoveItemAction action) {
  return List.from(items)..removeWhere((item) => item.name == action.item.name);
}

List<CartItem> _loadItems(List<CartItem> items, ItemLoadedAction action) {
  return action.items;
}
