import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_type.dart';

part 'feed_item.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class FeedItem extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int points;

  @HiveField(3)
  final String user;

  @HiveField(4)
  final int time;

  @HiveField(5)
  @JsonKey(name: 'time_ago')
  final String timeAgo;

  @JsonKey(name: 'comments_count')
  @HiveField(6)
  final int commentsCount;

  @HiveField(7)
  final ItemType type;

  @HiveField(8)
  final String url;

  @HiveField(9)
  final String domain;

  FeedItem(this.id, this.title, this.points, this.user, this.time, this.timeAgo, this.commentsCount, this.type,
      this.url, this.domain);

  factory FeedItem.fromJson(Map<String, dynamic> json) => _$FeedItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedItemToJson(this);
}
