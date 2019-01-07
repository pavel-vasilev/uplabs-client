import 'package:flutter/material.dart';
import 'package:uplabs/models/profile.dart';
import 'package:uplabs/widgets/profile_header.dart';
import 'package:uplabs/repository/user_repository_provider.dart';

class ProfileScreen extends StatelessWidget {
  final String nickname;

  ProfileScreen({Key key, this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repository = UserRepositoryProvider.of(context).repository;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: FutureBuilder<Profile>(
          future: repository.getProfile(nickname),
          builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var profile = snapshot.data;
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 24.0,
                ),
                child: ProfileHeader(
                  user: profile.user,
                ),
              );
            } else {
              var user = repository.getUser(nickname);
              if (user != null) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: ProfileHeader(
                    user: user,
                  ),
                );
              } else {
                return Container();
              }
            }
          },
        ),
      ),
    );
  }
}