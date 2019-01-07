import 'package:uplabs/models/user.dart';
import 'package:uplabs/models/post.dart';

class Profile {
  final User user;
  final List<Post> posts;

  Profile(this.user, this.posts);

  factory Profile.fromJson(List<dynamic> json) {
    var posts = json.map((it) => Post.fromJson(it)).toList();
    var user = posts.first.author;
    return Profile(user, posts);
  }
}