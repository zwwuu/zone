import 'package:flutter/material.dart';
import 'package:zone/features/bookmark/views/widgets/bookmark_list.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookmarks'),
        ),
        body: const BookmarkList(),
      ),
    );
  }
}
