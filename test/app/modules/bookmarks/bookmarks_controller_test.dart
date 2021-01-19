import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zone/app/modules/bookmarks/bookmark_controller.dart';
import 'package:zone/app/modules/bookmarks/bookmark_module.dart';

void main() {
  initModule(BookmarkModule());
   BookmarkController bookmark;
  //
  setUp(() {
         bookmark = BookmarkModule.to.get<BookmarkController>();
  });

  group('BookmarkController Test', () {
    test("First Test", () {
      expect(bookmark, isInstanceOf<BookmarkController>());
    });

    //   test("Set Value", () {
    //     expect(bookmark.value, equals(0));
    //     bookmark.increment();
    //     expect(bookmark.value, equals(1));
    //   });
  });
}
