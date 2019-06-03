import 'package:shopping_cart/enums/visibility_filter.dart';
import 'package:shopping_cart/models/cart_item.dart';
import 'package:shopping_cart/store/state.dart';

List<CartItem> itemsSortedSelector(AppState state) =>
    List.from(state.cartItems)..sort((a, b) => a.createdAt.compareTo(b.createdAt));

bool isAllItemsCompletedSelector(AppState state) => state.cartItems.every((cartItem) => cartItem.completed);

int activeItemsCountSelector(AppState state) =>
    state.cartItems.fold(0, (sum, cartItem) => !cartItem.completed ? ++sum : sum);

int completedItemsCountSelector(AppState state) =>
    state.cartItems.fold(0, (sum, cartItem) => cartItem.completed ? ++sum : sum);

List<CartItem> itemsWhereSelector(
  AppState state,
  VisibilityFilter activeFilter,
) {
  return state.cartItems.where((cartItem) {
    switch (activeFilter) {
      case VisibilityFilter.active:
        return !cartItem.completed;
      case VisibilityFilter.completed:
        return !cartItem.completed;
      default:
        return true;
    }
  }).toList();
}
