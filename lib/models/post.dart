import 'dart:core';
import 'package:uplabs/models/user.dart';

class Post {
  final int id;
  final String title;
  final String description;
  final String teaserUrl;
  final String category;
  final String subcategory;
  final User author;
  final DateTime showcasedAt;
  final bool hasGoldMedal;
  final bool hasSilverMedal;
  final bool hasBronzeMedal;

  Post(
      this.id,
      this.title,
      this.description,
      this.teaserUrl,
      this.category,
      this.subcategory,
      this.author,
      this.showcasedAt,
      this.hasGoldMedal,
      this.hasSilverMedal,
      this.hasBronzeMedal,
      );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json["id"],
      json["name"],
      json["description_without_html"],
      json["teaser_url"],
      json["category_friendly_name"],
      json["subcategory_friendly_name"],
      User.fromJson(json["serialized_submitter"]),
      json["showcased_at"] != null ? DateTime.parse(json["showcased_at"]) : null,
      json["gold_medal"],
      json["silver_medal"],
      json["bronze_medal"],
    );
  }
}