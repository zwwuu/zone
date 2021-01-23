import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bookmark_controller.dart';
import 'widgets/bookmark_list_body.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends ModularState<BookmarkPage, BookmarkController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    controller.loadBookmarks();
  }

  @override
  void dispose() {
    controller.deleteMarked();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: BookmarkListBody(),
    );
  }
}
