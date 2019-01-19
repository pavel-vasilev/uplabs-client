import 'package:flutter/material.dart';
import 'package:uplabs/dependencies.dart';
import 'package:uplabs/models/comment.dart';
import 'package:uplabs/widgets/comment_tile.dart';

class CommentsScreen extends StatelessWidget {
  final int postId;

  CommentsScreen({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Stack(
            children: <Widget>[
              FutureBuilder<List<Comment>>(
                future: postRepository.getComments(postId),
                builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var comments = snapshot.data;
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 16.0,
                          ),
                          child: CommentTile(
                            comment: comments[index],
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 24.0,
                              horizontal: 16.0,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(8.0),
                        iconSize: 32.0,
                        icon: Icon(Icons.send),
                        onPressed: () {},
                        color: Theme.of(context).accentIconTheme.color,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}