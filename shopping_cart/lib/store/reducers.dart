import 'package:shopping_cart/models/cart_item.dart';

import 'store.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return _addItem(state.cartItems, action);
  } else if (action is ToggleItemStateAction) {
    return _toggleItemState(state.cartItems, action);
  } else if (action is RemoveItemAction) {
    return _removeItem(state.cartItems, action);
  } else if (action is ItemLoadedAction) {
    return _loadItems(action);
  }
  return state;
}

AppState _addItem(List<CartItem> items, AddItemAction action) {
  return AppState(List.from(items)..add(action.item));
}

AppState _toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return AppState(items.map((item) => item.name == action.item.name ? action.item : item).toList());
}

AppState _removeItem(List<CartItem> items, RemoveItemAction action) {
  return AppState(List.from(items)..removeWhere((item) => item.name == action.item.name));
}

AppState _loadItems(ItemLoadedAction action) {
  return AppState(action.items);
}
