import 'dart:collection';

import 'package:contacts_app/models/models.dart';
import 'package:flutter/material.dart';

mixin UsersRepository on ChangeNotifier {
  final List<User> _users = [];

  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void addUsers(List<User> users) {
    _users.addAll(users);
    notifyListeners();
  }
}
