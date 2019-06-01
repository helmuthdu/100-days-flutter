import 'package:contacts_app/pages/contacts.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'App',
      home: ContactsPage(),
    );
  }
}
