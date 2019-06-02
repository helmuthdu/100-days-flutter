import 'package:shopping_cart/enums/visibility_filter.dart';
import 'package:shopping_cart/models/cart_item.dart';

List<CartItem> getCartItemsSorted(List<CartItem> cartItems) =>
    List.from(cartItems)..sort((a, b) => a.createdAt.compareTo(b.createdAt));

bool allCompletedItemsSelector(List<CartItem> cartItems) => cartItems.every((cartItem) => cartItem.completed);

int numActiveItemsSelector(List<CartItem> cartItems) =>
    cartItems.fold(0, (sum, cartItem) => !cartItem.completed ? ++sum : sum);

int numCompletedItemsSelector(List<CartItem> cartItems) =>
    cartItems.fold(0, (sum, cartItem) => cartItem.completed ? ++sum : sum);

List<CartItem> filteredCartItemsSelector(
  List<CartItem> cartItems,
  VisibilityFilter activeFilter,
) {
  return cartItems.where((cartItem) {
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
