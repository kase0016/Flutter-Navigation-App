import 'package:flutter/material.dart';

class User {
  String first_name;
  String last_name;
  String email;

  User({
    required this.first_name,
    required this.last_name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> dataMap) {
    return User(
      first_name: dataMap['name']['first'],
      last_name: dataMap['name']['last'],
      email: dataMap['email'],
    );
  }
}
