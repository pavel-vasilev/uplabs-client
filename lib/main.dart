import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:uplabs/routes.dart';
import 'package:uplabs/screens/profile.dart';
import 'package:uplabs/network/uplabs_api.dart';
import 'package:uplabs/repository/user_repository.dart';
import 'package:uplabs/repository/user_repository_provider.dart';

void main() {
  var router = Router();
  router.define('/users/:nickname', handler: profileRoute);
  router.define('/users/:nickname/followers', handler: followersRoute);
  router.define('/users/:nickname/following', handler: followingRoute);
  var api = UplabsApi('https://uplabs.com', http.Client(), json);
  var repository = UserRepository(api);
  runApp(
    UserRepositoryProvider(
      repository: repository,
      child: MaterialApp(
        title: 'Uplabs',
        home: ProfileScreen(
          nickname: 'ramotion',
        ),
        onGenerateRoute: router.generator,
      ),
    ),
  );
}