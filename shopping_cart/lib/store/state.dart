import 'package:meta/meta.dart';
import 'package:shopping_cart/models/cart_item.dart';

@immutable
class AppState {
  static var empty = AppState(cartItems: []);

  final List<CartItem> cartItems;

  AppState({@required this.cartItems});

  AppState copyWith({
    List<CartItem> cartItems,
  }) =>
      AppState(
        cartItems: cartItems ?? this.cartItems,
      );

  AppState.fromJson(Map<String, dynamic> json)
      : cartItems = (json['cartItems'] as List<dynamic>).map((item) => CartItem.fromJson(item)).toList();

  Map<String, dynamic> toJson() => {'cartItems': cartItems};

  @override
  String toString() => "{cartItems: $cartItems}";
}
