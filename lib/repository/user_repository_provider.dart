import 'package:flutter/material.dart';
import 'package:uplabs/repository/user_repository.dart';

class UserRepositoryProvider extends InheritedWidget {
  final UserRepository repository;

  UserRepositoryProvider({Key key, this.repository, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UserRepositoryProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(UserRepositoryProvider);
}