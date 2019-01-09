import 'package:flutter/material.dart';
import 'package:uplabs/dependencies.dart';
import 'package:uplabs/models/profile.dart';
import 'package:uplabs/widgets/profile_header.dart';
import 'package:uplabs/widgets/profile_stats.dart';
import 'package:uplabs/widgets/post_preview.dart';

class ProfileScreen extends StatelessWidget {
  final String nickname;

  ProfileScreen({Key key, this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              return ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: ProfileHeader(
                      user: profile.user,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: ProfileStats(
                      user: profile.user,
                    ),
                  ),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: profile.posts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return PostPreview(
                        post: profile.posts[index],
                      );
                    },
                  ),
                ],
              );
            } else {
              var user = repository.getUser(nickname);
              if (user != null) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: ProfileHeader(
                        user: user,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: ProfileStats(
                        user: user,
                      ),
                    ),
                  ],
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