import 'package:isar/isar.dart';
import 'package:zone/core/models/item_type.dart';

part 'bookmark.g.dart';

@collection
class Bookmark {
  final Id id;
  @enumerated
  final ItemType type;
  final DateTime createdAt;

  Bookmark({required this.id, required this.type, required this.createdAt});
}
