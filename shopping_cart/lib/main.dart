import 'package:flutter/material.dart';
import 'package:shopping_cart/app.dart';
import 'package:shopping_cart/store/store.dart';

void main() {
  runApp(App(store: createStore()));
}
