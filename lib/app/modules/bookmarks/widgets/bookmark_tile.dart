import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../service/share_service.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/models/feed_item.dart';
import '../../../shared/widgets/tile.dart';
import '../bookmark_controller.dart';

class BookmarkTile extends StatelessWidget {
  final int index;
  final FeedItem bookmark;
  final GestureTapCallback onTap;
  final BookmarkController controller = Modular.get();
  final ShareService shareService = Modular.get();

  BookmarkTile({Key key, this.index, this.bookmark, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: actionExtentRatio,
      actionPane: SlidableDrawerActionPane(),
      child: Tile(
        title: Text(bookmark.title),
        type: bookmark.type,
        user: bookmark.user,
        domain: bookmark.domain,
        time: bookmark.time,
        onTap: onTap,
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.blueGrey,
          icon: MdiIcons.bookmarkRemove,
          onTap: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Bookmark deleted'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    controller.undoDelete(index, bookmark);
                  },
                ),
              ),
            );

            controller.deleteBookmark(bookmark);
          },
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: MdiIcons.shareVariant,
          onTap: () {
            shareService.share(title: bookmark.title, url: bookmark.url);
          },
        ),
      ],
    );
  }
}
