import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/bookmark/bookmark_empty_list.dart';
import '../../shared/widgets/bookmark/bookmark_list.dart';
import 'bookmark_controller.dart';

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
      body: Observer(
        builder: (context) {
          return controller.bookmarks.isEmpty ? BookmarkEmptyList() : BookmarkList();
        },
      ),
    );
  }
}
