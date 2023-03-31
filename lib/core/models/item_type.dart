import 'package:json_annotation/json_annotation.dart';

enum ItemType {
  @JsonValue('job')
  job,
  @JsonValue('story')
  story,
  @JsonValue('comment')
  comment,
  @JsonValue('poll')
  poll,
  @JsonValue('pollopt')
  pollopt,
}
