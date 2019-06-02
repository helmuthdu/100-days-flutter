import 'package:redux/redux.dart';
import 'package:shopping_cart/models/cart_item.dart';

import 'actions.dart';

final cartItemReducers = combineReducers<List<CartItem>>([
  TypedReducer<List<CartItem>, AddItemAction>(_addItem),
  TypedReducer<List<CartItem>, LoadItemsAction>(_loadItems),
  TypedReducer<List<CartItem>, RemoveItemAction>(_removeItem),
  TypedReducer<List<CartItem>, ToggleItemStateAction>(_toggleItemState),
]);

List<CartItem> _addItem(List<CartItem> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<CartItem> _loadItems(List<CartItem> items, LoadItemsAction action) {
  return action.items;
}

List<CartItem> _removeItem(List<CartItem> items, RemoveItemAction action) {
  return List.from(items)..removeWhere((item) => item.id == action.item.id);
}

List<CartItem> _toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return items.map((item) => item.id == action.item.id ? action.item : item).toList();
}
