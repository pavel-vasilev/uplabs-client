class User {
  final int id;
  final String nickname;
  final String fullName;
  final String headline;
  final String avatarUrl;
  final int followers;
  final int following;

  User(this.id, this.nickname, this.fullName, this.headline, this.avatarUrl,
      this.followers, this.following);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["id"],
      json["nickname"],
      json["full_name"],
      json["headline"],
      json["avatar_url"],
      json["followers_count"],
      json["following_count"],
    );
  }
}