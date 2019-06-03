import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String avatar;
  final String notes;

  User({
    this.name = '',
    this.username = '',
    this.email = '',
    this.phoneNumber = '',
    this.avatar = '',
    this.notes = '',
    String id,
  }) : this.id = id ?? Uuid().v4();

  User copyWith(
          {String id,
          String name,
          String username,
          String email,
          String phoneNumber,
          String avatar,
          String notes}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        avatar: avatar ?? this.avatar,
        notes: notes ?? this.notes,
      );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        avatar = json['avatar'],
        notes = json['notes'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'avatar': avatar,
        'notes': notes
      };

  Map<String, TextEditingController> toFormControl() => {
        'id': TextEditingController(),
        'name': TextEditingController(),
        'username': TextEditingController(),
        'email': TextEditingController(),
        'phoneNumber': TextEditingController(),
        'avatar': TextEditingController.fromValue(
            TextEditingValue(text: 'https://api.adorable.io/avatars/128/.png')),
        'notes': TextEditingController(),
      };

  @override
  String toString() {
    return 'User{name: $name, username: $username, email: $email, phoneNumber: $phoneNumber, avatar: $avatar, notes: $notes, id: $id}';
  }
}
