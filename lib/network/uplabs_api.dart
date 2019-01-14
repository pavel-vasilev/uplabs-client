import 'dart:async';
import 'dart:convert' show JsonCodec;
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:uplabs/models/user.dart';
import 'package:uplabs/models/profile.dart';
import 'package:uplabs/models/comment.dart';

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

  Future<List<Comment>> getComments(int postId) async {
    var response = await client.get('$baseUrl/comments.json?commentable_type=post&commentable_id=$postId');
    List<dynamic> json = codec.decode(response.body)['comments'];
    var comments = json.map((it) => Comment.fromJson(it)).toList();
    return comments;
  }

  Future<String> upload(File file) async {
    var objectName = basename(file.path);
    var contentType = lookupMimeType(file.path);
    var response = await client.get('$baseUrl/uploads/signing_url?objectName=$objectName&contentType=$contentType');
    var urls = codec.decode(response.body);
    var signedUrl = urls['signedUrl'];
    var fileUrl = urls['fileUrl'];
    var body = await file.readAsBytes();
    var headers = {
      "x-amz-acl": "public-read",
      "Content-Type": contentType
    };
    await client.put(signedUrl, headers: headers, body: body);
    return fileUrl;
  }
}