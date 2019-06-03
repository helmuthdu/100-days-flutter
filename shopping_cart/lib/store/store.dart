import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'middleware.dart';
import 'reducers.dart';
import 'state.dart';

export 'modules/cart_item/actions.dart';
export 'modules/cart_item/reducers.dart';
export 'modules/cart_item/selectors.dart';
export 'middleware.dart';
export 'reducers.dart';
export 'state.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.empty,
    distinct: true,
    middleware: [thunkMiddleware, ...createMiddleware()],
  );
}
