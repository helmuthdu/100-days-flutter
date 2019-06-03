import 'modules/cart_item/reducers.dart';
import 'state.dart';

AppState appReducer(AppState state, action) => AppState(cartItems: cartItemReducers(state.cartItems, action));
