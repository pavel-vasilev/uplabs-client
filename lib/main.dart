import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uplabs/screens/profile.dart';
import 'package:uplabs/network/uplabs_api.dart';
import 'package:uplabs/repository/user_repository.dart';
import 'package:uplabs/repository/user_repository_provider.dart';

void main() {
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
      ),
    ),
  );
}