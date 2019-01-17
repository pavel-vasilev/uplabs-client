import 'dart:async';
import 'package:uplabs/network/uplabs_api.dart';
import 'package:uplabs/models/post.dart';
import 'package:uplabs/models/comment.dart';
import 'package:uplabs/cache/storage.dart';

class PostRepository {
  final UplabsApi api;

  final Storage storage;

  PostRepository(this.api, this.storage);

  Post getPost(int postId) => storage.get(postId);

  Future<List<Comment>> getComments(int postId) async {
    return api.getComments(postId);
  }

  Future<List<Comment>> getRecentComments(int postId) async {
    return api.getComments(postId).then((it)=>it.take(3).toList());
  }
}