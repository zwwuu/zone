import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../modules/bookmarks/bookmark_controller.dart';
import '../../util/url.dart';
import 'bookmark_tile.dart';

class BookmarkList extends StatelessWidget {
  final SlidableController _slidableController = SlidableController();
  final BookmarkController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
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
          child: BookmarkTile(
            user: bookmark.user,
            title: bookmark.title,
            domain: bookmark.domain,
            time: bookmark.time,
            type: bookmark.type,
            onTap: () {
              Modular.to.pushNamed('/item/${bookmark.id}');
            },
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.blueGrey,
              icon: MdiIcons.bookmarkRemove,
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Bookmark deleted'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      controller.undoDelete(index, bookmark);
                    },
                  ),
                ));

                controller.deleteBookmark(bookmark);
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
  }
}
