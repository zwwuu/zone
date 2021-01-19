// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BookmarkController = BindInject(
  (i) => BookmarkController(i<BookmarkRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookmarkController on _BookmarksControllerBase, Store {
  final _$bookmarksAtom = Atom(name: '_BookmarksControllerBase.bookmarks');

  @override
  ObservableList<FeedItem> get bookmarks {
    _$bookmarksAtom.reportRead();
    return super.bookmarks;
  }

  @override
  set bookmarks(ObservableList<FeedItem> value) {
    _$bookmarksAtom.reportWrite(value, super.bookmarks, () {
      super.bookmarks = value;
    });
  }

  final _$loadBookmarksAsyncAction =
      AsyncAction('_BookmarksControllerBase.loadBookmarks');

  @override
  Future<void> loadBookmarks() {
    return _$loadBookmarksAsyncAction.run(() => super.loadBookmarks());
  }

  final _$deleteBookmarkAsyncAction =
      AsyncAction('_BookmarksControllerBase.deleteBookmark');

  @override
  Future<void> deleteBookmark(FeedItem feedItem) {
    return _$deleteBookmarkAsyncAction
        .run(() => super.deleteBookmark(feedItem));
  }

  @override
  String toString() {
    return '''
bookmarks: ${bookmarks}
    ''';
  }
}
