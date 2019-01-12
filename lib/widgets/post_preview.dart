import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uplabs/models/post.dart';

class PostPreview extends StatelessWidget {
  final Post post;

  PostPreview({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medal;
    if (post.hasGoldMedal) {
      medal = "gold";
    } else if (post.hasSilverMedal) {
      medal = "silver";
    } else if (post.hasBronzeMedal) {
      medal = "bronze";
    }
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/posts/${post.id}'),
      child: Stack(
        children: <Widget>[
          Hero(
            tag: post.id,
            child: Image.network(
              post.teaserUrl,
            ),
          ),
          medal != null
              ? Positioned(
                  top: 0.0,
                  right: 8.0,
                  child: SvgPicture.asset(
                    'images/$medal/${post.category.toLowerCase()}.svg',
                    width: 48.0,
                    height: 48.0,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}