import 'package:meta/meta.dart';
import 'package:shopping_cart/models/cart_item.dart';

@immutable
class AppState {
  static var empty = AppState();

  final List<CartItem> cartItems;

  AppState({this.cartItems = const []});

  AppState copyWith({
    List<CartItem> cartItems,
  }) =>
      AppState(
        cartItems: cartItems ?? this.cartItems,
      );

  AppState.fromJson(Map<String, dynamic> json)
      : cartItems = (json['cartItems'] as List<Map<String, dynamic>>).map((item) => CartItem.fromJson(item)).toList();

  Map<String, dynamic> toJson() => {'cartItems': cartItems};

  @override
  String toString() => "{cartItems: $cartItems}";
}
