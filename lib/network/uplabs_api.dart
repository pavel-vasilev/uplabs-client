import 'dart:async';
import 'dart:convert' show JsonCodec;
import 'package:http/http.dart' show Client;
import 'package:uplabs/models/user.dart';
import 'package:uplabs/models/profile.dart';

class UplabsApi {
  final String baseUrl;
  final Client client;
  final JsonCodec codec;

  UplabsApi(this.baseUrl, this.client, this.codec);

  Future<Profile> getProfile(String nickname, int page) async {
    var response = await client.get('$baseUrl/users/$nickname.json?page=$page');
    var profile = Profile.fromJson(codec.decode(response.body));
    return profile;
  }

  Future<List<User>> getFollowers(String nickname) async {
    var response = await client.get('$baseUrl/users/$nickname/followers.json');
    List<dynamic> json = codec.decode(response.body);
    var users = json.map((it) => User.fromJson(it)).toList();
    return users;
  }

  Future<List<User>> getFollowing(String nickname) async {
    var response = await client.get('$baseUrl/users/$nickname/followings.json');
    List<dynamic> json = codec.decode(response.body);
    var users = json.map((it) => User.fromJson(it)).toList();
    return users;
  }
}