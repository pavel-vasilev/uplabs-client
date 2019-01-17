import 'package:flutter/material.dart';
import 'package:uplabs/dependencies.dart';
import 'package:uplabs/models/user.dart';
import 'package:uplabs/widgets/profile_tile.dart';

class FollowersScreen extends StatelessWidget {
  final String nickname;

  FollowersScreen({Key key, this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: FutureBuilder<List<User>>(
        future: userRepository.getFollowers(nickname),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final users = snapshot.data;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ProfileTile(
                  user: users[index],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}