import 'package:json_annotation/json_annotation.dart';
import 'package:zone/core/models/item_type.dart';

part 'item.g.dart';

@JsonSerializable(explicitToJson: true)
class Item {
  final int id;
  final bool deleted;
  final ItemType type;
  final String by;
  final int? time;
  final String text;
  final bool dead;
  final int? parent;
  final int? poll;
  final List<int> kids;
  final String? url;
  final int? score;
  final String title;
  final List<int> parts;
  final int descendants;

  Item(
      {required this.id,
      this.deleted = false,
      required this.type,
      this.by = '',
      this.time,
      this.text = '',
      this.dead = false,
      this.parent,
      this.poll,
      this.kids = const [],
      this.url,
      this.score,
      this.title = '',
      this.parts = const [],
      this.descendants = 0});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
