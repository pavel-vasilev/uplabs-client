import 'dart:async';
import 'package:uplabs/models/user.dart';
import 'package:uplabs/models/profile.dart';
import 'package:uplabs/network/uplabs_api.dart';

class UserRepository {
  final UplabsApi api;

  final Map<String, User> cache = {};

  UserRepository(this.api);

  User getUser(String nickname) => cache[nickname];

  Future<Profile> getProfile(String nickname) async {
    var profile = await api.getProfile(nickname);
    var user = profile.user;
    cache[user.nickname] = user;
    return profile;
  }

  Future<List<User>> getFollowers(String nickname) async {
    var users = await api.getFollowers(nickname);
    users.forEach((user) => cache[user.nickname] = user);
    return users;
  }

  Future<List<User>> getFollowing(String nickname) async {
    var users = await api.getFollowing(nickname);
    users.forEach((user) => cache[user.nickname] = user);
    return users;
  }
}