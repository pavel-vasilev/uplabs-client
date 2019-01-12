import 'package:flutter/material.dart';
import 'package:uplabs/models/comment.dart';

class CommentTile extends StatelessWidget {
  final Comment comment;

  CommentTile({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(comment.user.avatarUrl),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                comment.user.fullName,
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 18.0),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                comment.user.nickname,
                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14.0),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                comment.body,
                style: Theme.of(context).textTheme.body1.copyWith(height: 1.25),
              ),
            ],
          ),
        ),
      ],
    );
  }
}