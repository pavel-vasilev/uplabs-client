import 'package:flutter/material.dart';
import 'package:uplabs/models/post.dart';

class PostStats extends StatelessWidget {
  final Post post;

  PostStats({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Theme.of(context).textTheme.title;
    var subtitle = title.copyWith(
      fontSize: 18.0,
      color: Color.fromARGB(77, 0, 0, 0),
    );
    return Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${post.comments}',
                  style: title,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Comments",
                  style: subtitle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${post.points}',
                  style: title,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Upvotes",
                  style: subtitle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${post.views}',
                  style: title,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Views",
                  style: subtitle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}