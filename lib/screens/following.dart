import 'package:flutter/material.dart';
import 'package:uplabs/models/user.dart';
import 'package:uplabs/widgets/profile_tile.dart';
import 'package:uplabs/repository/user_repository_provider.dart';

class FollowingScreen extends StatelessWidget {
  final String nickname;

  FollowingScreen({Key key, this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repository = UserRepositoryProvider.of(context).repository;
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'),
      ),
      body: FutureBuilder<List<User>>(
        future: repository.getFollowing(nickname),
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