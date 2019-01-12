import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluro/fluro.dart';
import 'package:uplabs/routes.dart';
import 'package:uplabs/network/uplabs_api.dart';
import 'package:uplabs/repository/user_repository.dart';

final api = UplabsApi('https://uplabs.com', http.Client(), json);

final repository = UserRepository(api, {});

final router = Router()
  ..define('/users/:nickname', handler: profileRoute)
  ..define('/users/:nickname/followers', handler: followersRoute)
  ..define('/users/:nickname/following', handler: followingRoute)
  ..define('/posts/:id', handler: postDetailsRoute);