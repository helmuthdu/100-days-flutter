import 'dart:async';
import 'dart:convert';

import 'package:contacts_app/models/models.dart';
import 'package:http/http.dart' as http;

class UsersApi {
  static Future<List<User>> getAll() async {
    try {
      final List response =
          jsonDecode((await http.get('http://localhost:3000/users')).body);
      return response.map((user) => User.fromJson(user)).toList();
    } catch (err) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> addUser(User user) async {
    try {
      return jsonDecode(
          (await http.post('http://localhost:3000/users', body: user.toJson()))
              .body);
    } catch (err) {
      return null;
    }
  }
}
