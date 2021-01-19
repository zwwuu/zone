import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_type.g.dart';

@HiveType(typeId: 0)
enum ItemType {
  @JsonValue('job')
  @HiveField(0)
  job,

  @JsonValue('ask')
  @HiveField(1)
  ask,

  @JsonValue('comment')
  @HiveField(2)
  comment,

  @JsonValue('story')
  @HiveField(3)
  story,

  @JsonValue('poll')
  @HiveField(4)
  poll,

  @JsonValue('pollopt')
  @HiveField(5)
  pollopt,

  @JsonValue('link')
  @HiveField(6)
  link
}
