import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:uplabs/screens/profile.dart';
import 'package:uplabs/screens/followers.dart';
import 'package:uplabs/screens/following.dart';
import 'package:uplabs/screens/post_details.dart';
import 'package:uplabs/screens/comments.dart';

var profileRoute = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ProfileScreen(
      nickname: params['nickname'][0],
    );
  },
);

var followersRoute = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FollowersScreen(
      nickname: params['nickname'][0],
    );
  },
);

var followingRoute = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FollowingScreen(
      nickname: params['nickname'][0],
    );
  },
);

var postDetailsRoute = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PostDetailsScreen(
    postId: int.parse(params['id'][0]),
  );
});

var commentsRoute = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CommentsScreen(
    postId: int.parse(params['id'][0]),
  );
});