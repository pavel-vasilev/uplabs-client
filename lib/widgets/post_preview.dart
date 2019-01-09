import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uplabs/models/post.dart';

class PostPreview extends StatelessWidget {
  final Post post;

  PostPreview({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(post.teaserUrl),
        post.hasGoldMedal
            ? Positioned(
                top: 0.0,
                right: 8.0,
                child: SvgPicture.asset(
                  'images/${post.category.toLowerCase()}.svg',
                  width: 48.0,
                  height: 48.0,
                ),
              )
            : Container(),
      ],
    );
  }
}