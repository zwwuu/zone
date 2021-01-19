import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item_type.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class Item {
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

  @JsonKey(name: 'time_ago')
  @HiveField(5)
  final String timeAgo;

  @HiveField(6)
  final ItemType type;

  @HiveField(7)
  final String url;

  @HiveField(8)
  final String domain;

  @HiveField(9)
  final String content;

  @HiveField(10)
  final List<Item> comments;

  @JsonKey(name: 'comments_count')
  @HiveField(11)
  final int commentsCount;

  Item(this.id, this.title, this.points, this.user, this.time, this.timeAgo, this.type, this.comments,
      this.commentsCount, this.url, this.domain, this.content);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
