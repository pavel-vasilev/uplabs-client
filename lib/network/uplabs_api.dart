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

  Future<void> createPost(String title, String description, String previewUrl, String sourceUrl) async {
    var body = {
      "utf8": "✓",
      "authenticity_token": "",
      "post[name]": title,
      "post[description]": description,
      "post[tags]": "",
      "post[demo_url]": "",
      "post[tools]": "",
      "post[fonts]": "",
      "post[makers_twitter]": "",
      "post[made_by_submitter]": "0",
      "post[source_file_url]": sourceUrl,
      "post[free_post]": "1",
      "post[free_license]": "personal_and_commercial",
      "post[paid_post]": "0",
      "post[screenshots]": "",
      "post[category_id]": "1",
      "post[custom_preview_url]": previewUrl,
      "post[source_name]": "image_url",
      "post[source_format]": "standard",
      "post[maker_name]": "",
      "post[label]": "",
      "post[pattern]": "",
      "post[section]": "showcase",
      "post[source_id]": "",
      "post[source_version]": "",
      "post[embeddable]": "false",
      "post[use_ssl]": "false",
      "post[full_page]": "false",
      "post[youtube_video_id]": "",
      "post[url]": "",
      "post[extra_info]": "{}",
      "post[payload]": '{"innerState":"initialized","custom_preview_url":$previewUrl,"free_post":true,"paid_post":false,"validationParams":{},"makers_twitter":"","name":$title","url":null,"maker_name":null,"description":$description,"tags":null,"source_id":null,"source_name":"image_url","category_id":1,"label":null,"price":10,"demo_url":null,"screenshots":[],"price_extended":100,"showcase_later":false,"source_format":"standard","source_version":null,"platform":null,"extra_info":{},"embeddable":false,"youtube_video_id":null,"payload":null,"priority":"tomorrow","industry":null,"style":null,"pattern":null,"fonts":[],"plugins":[],"made_by_submitter":false,"tools":[],"use_ssl":false,"challenge_id":null,"source_file_url":$sourceUrl,"section":"showcase","full_page":false,"free_license":null,"share_networks":[]}',
      "post[showcase_later]": "0",
    };
    await client.post('$baseUrl/posts', body: body);
  }
}