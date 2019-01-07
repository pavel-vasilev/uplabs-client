import 'package:flutter/material.dart';
import 'package:uplabs/models/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  ProfileHeader({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Hero(
          tag: user.nickname,
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
            radius: 50.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          user.fullName,
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          user.nickname,
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(
          height: 8.0,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.person_add),
          label: Text('Follow'),
        ),
      ],
    );
  }
}