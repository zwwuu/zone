import 'dart:async';

import 'package:isar/isar.dart';
import 'package:zone/features/bookmark/models/bookmark.dart';

class BookmarkRepository {
  BookmarkRepository({required this.isar});

  final Isar isar;

  Stream<List<Bookmark>> watchBookmarks() {
    final query = isar.bookmarks.where();

    return query.watch(fireImmediately: true);
  }

  Future<List<Bookmark>> getBookmarks() async {
    return await isar.bookmarks.where().findAll();
  }

  Future<Bookmark?> getBookmark(int id) async {
    return await isar.bookmarks.get(id);
  }

  Future<int> addBookmark(Bookmark bookmark) async {
    return await isar.writeTxn(() async {
      return await isar.bookmarks.put(bookmark);
    });
  }

  Future<bool> deleteBookmark(int bookmarkId) async {
    return await isar.writeTxn(() async {
      final status = await isar.bookmarks.delete(bookmarkId);
      return status;
    });
  }
}
