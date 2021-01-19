import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/feed_item.dart';
import '../models/item_type.dart';

part 'bookmark_repository.g.dart';

@Injectable()
class BookmarkRepository extends Disposable {
  String key = 'bookmarks';

  final Completer<Box> _completer = Completer<Box>();

  BookmarkRepository() {
    _init();
  }

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(ItemTypeAdapter());
    Hive.registerAdapter(FeedItemAdapter());

    var box = await Hive.openBox(key);
    if (!_completer.isCompleted) _completer.complete(box);
  }

  Future delete(int key) async {
    final box = await _completer.future;
    await box.delete(key);
  }

  Future<List<FeedItem>> getAll() async {
    final box = await _completer.future;

    return box.values.isEmpty ? [] : List<FeedItem>.from(box.values);
  }

  Future<void> add(FeedItem item) async {
    final box = await _completer.future;
    await box.add(item);
  }

  //dispose will be called automatically
  @override
  void dispose() {
    Hive.close();
  }
}
