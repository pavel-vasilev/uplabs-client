import 'dart:async';
import 'package:uplabs/models/user.dart';
import 'package:uplabs/models/profile.dart';
import 'package:uplabs/network/uplabs_api.dart';
import 'package:uplabs/cache/storage.dart';

class UserRepository {
  final UplabsApi api;

  final Storage storage;

  UserRepository(this.api, this.storage);

  User getUser(String nickname) => storage.get(nickname);

  Future<Profile> getProfile(String nickname, [int page = 1]) async {
    var profile = await api.getProfile(nickname, page);
    var user = profile.user;
    var posts = profile.posts;
    storage.set(user.nickname, user);
    posts.forEach((post) => storage.set(post.id, post));
    return profile;
  }

  Future<List<User>> getFollowers(String nickname) async {
    var users = await api.getFollowers(nickname);
    users.forEach((user) => storage.set(user.nickname, user));
    return users;
  }

  Future<List<User>> getFollowing(String nickname) async {
    var users = await api.getFollowing(nickname);
    users.forEach((user) => storage.set(user.nickname, user));
    return users;
  }
}