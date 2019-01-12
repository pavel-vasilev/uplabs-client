import 'dart:core';
import 'package:uplabs/models/user.dart';

class Comment {
  final int id;
  final String body;
  final DateTime createdAt;
  final User user;

  Comment(
    this.id,
    this.body,
    this.createdAt,
    this.user,
  );

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      json['id'],
      json['body'],
      DateTime.parse(json['created_at']),
      User.fromJson(json['user']),
    );
  }
}