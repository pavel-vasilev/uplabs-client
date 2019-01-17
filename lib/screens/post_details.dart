import 'package:flutter/material.dart';
import 'package:uplabs/dependencies.dart';
import 'package:uplabs/models/comment.dart';
import 'package:uplabs/widgets/post_stats.dart';
import 'package:uplabs/widgets/comment_tile.dart';
import 'package:uplabs/widgets/profile_tile.dart';
import 'package:uplabs/widgets/section.dart';
import 'package:uplabs/widgets/separated.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;

  PostDetailsScreen({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = postRepository.getPost(postId);
    var title = Theme.of(context).textTheme.title.copyWith(fontSize: 24.0);
    var body = Theme.of(context).textTheme.body1.copyWith(fontSize: 18.0, height: 1.5);
    var button = Theme.of(context).textTheme.button.copyWith(fontSize: 18.0, color: Colors.deepOrangeAccent);
    var headline = Theme.of(context).textTheme.title.copyWith(fontSize: 32.0);
    var border = BoxDecoration(
      border: BorderDirectional(
        top: BorderSide(
          color: Color.fromARGB(32, 0, 0, 0),
        ),
        bottom: BorderSide(color: Color.fromARGB(32, 0, 0, 0)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: postId,
            child: Image.network(
              post.teaserUrl,
              width: double.infinity,
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Separated.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              separator: SizedBox(
                height: 16.0,
              ),
              children: <Widget>[
                Text(
                  post.title,
                  style: headline,
                ),
                Container(
                  decoration: border,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: PostStats(
                    post: post,
                  ),
                ),
                Text(
                  post.description,
                  style: body,
                ),
                Text(
                  "Creator",
                  style: title,
                ),
                ProfileTile(
                  user: post.author,
                ),
                FutureBuilder<List<Comment>>(
                  future: postRepository.getRecentComments(postId),
                  builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Section(
                        title: Text(
                          "Comments",
                          style: title,
                        ),
                        action: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "More",
                            style: button,
                          ),
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: CommentTile(
                              comment: snapshot.data[index],
                            ),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}