import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluro/fluro.dart';
import 'package:uplabs/routes.dart';
import 'package:uplabs/models/user.dart';
import 'package:uplabs/models/post.dart';
import 'package:uplabs/network/uplabs_api.dart';
import 'package:uplabs/cache/map_cache.dart';
import 'package:uplabs/cache/storage.dart';
import 'package:uplabs/repository/user_repository.dart';
import 'package:uplabs/repository/post_repository.dart';
import 'package:uplabs/network/cookie_client.dart';

final cookie = "";

final api = UplabsApi('https://www.uplabs.com', CookieClient(cookie, http.Client()), json);

final caches = [MapCache<String, User>(), MapCache<int, Post>()];

final storage = Storage(caches);

final userRepository = UserRepository(api, storage);

final postRepository = PostRepository(api, storage);

final router = Router()
  ..define('/users/:nickname', handler: profileRoute)
  ..define('/users/:nickname/followers', handler: followersRoute)
  ..define('/users/:nickname/following', handler: followingRoute)
  ..define('/posts/:id', handler: postDetailsRoute)
  ..define('/posts/:id/comments', handler: commentsRoute);