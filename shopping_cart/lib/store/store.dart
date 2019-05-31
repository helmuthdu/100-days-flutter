import 'package:shopping_cart/models/cart_item.dart';

export 'actions.dart';
export 'middleware.dart';
export 'reducers.dart';

class AppState {
  static var empty = AppState(new List());

  final List<CartItem> cartItems;

  AppState(this.cartItems);

  AppState.fromJson(Map<String, dynamic> json)
      : cartItems = (json['cartItems'] as List)
      .map((i) => new CartItem.fromJson(i as Map<String, dynamic>))
      .toList();

  Map<String, dynamic> toJson() => {'cartItems': cartItems};

  @override
  String toString() => "$cartItems";
}
