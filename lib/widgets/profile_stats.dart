import 'package:flutter/material.dart';
import 'package:uplabs/models/user.dart';

class ProfileStats extends StatelessWidget {
  final User user;

  ProfileStats({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('${user.followers}'),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text("Followers"),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('${user.following}'),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text("Following"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}