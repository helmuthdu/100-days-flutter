import 'package:contacts_app/pages/contacts.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'App',
      home: ContactsPage(),
    );
  }
}
