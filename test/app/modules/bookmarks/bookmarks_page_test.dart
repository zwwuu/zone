import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zone/app/modules/bookmarks/bookmark_page.dart';

void main() {
  testWidgets('BookmarkPage has title', (tester) async {
    await tester.pumpWidget(buildTestableWidget(BookmarkPage()));
    //  final titleFinder = find.text('Bookmark');
    //  expect(titleFinder, findsOneWidget);
  });
}
