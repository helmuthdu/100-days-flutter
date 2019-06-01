import 'modules/cart_item/reducers.dart';
import 'state.dart';

AppState appStateReducers(AppState state, action) {
  return AppState(cartItems: cartItemReducers(state.cartItems, action));
}
