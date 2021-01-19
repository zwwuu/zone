import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../shared/util/url.dart';
import '../../shared/widgets/item_tile/item_tile.dart';
import 'bookmark_controller.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends ModularState<BookmarkPage, BookmarkController> {
  final SlidableController _slidableController = SlidableController();

  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    controller.loadBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: Observer(
        builder: (context) {
          if (controller.bookmarks.isEmpty) {
            return Center(
              child: Text('Empty'),
            );
          }

          var bookmarks = controller.bookmarks;
          return ListView.separated(
            itemCount: bookmarks.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              var bookmark = bookmarks[index];
              return Slidable(
                key: Key(bookmark.id.toString()),
                controller: _slidableController,
                actionExtentRatio: 0.2,
                actionPane: SlidableDrawerActionPane(),
                child: ItemTile(
                  user: bookmark.user,
                  title: bookmark.title,
                  domain: bookmark.domain,
                  time: bookmark.time,
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.blueGrey,
                    icon: MdiIcons.bookmarkRemove,
                    onTap: () {
                      controller.deleteBookmark(bookmark);
                      Fluttertoast.showToast(
                        msg: 'Bookmark deleted',
                      );
                    },
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: MdiIcons.shareVariant,
                    onTap: () {
                      UrlUtil().share(title: bookmark.title, url: bookmark.url);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
