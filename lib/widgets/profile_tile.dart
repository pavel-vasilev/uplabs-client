import 'package:flutter/material.dart';
import 'package:uplabs/models/user.dart';

class ProfileTile extends StatelessWidget {
  final User user;

  ProfileTile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: Hero(
        tag: user.nickname,
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
      ),
      title: Text(user.fullName),
      onTap: () => Navigator.of(context).pushNamed('/users/${user.nickname}'),
    );
  }
}