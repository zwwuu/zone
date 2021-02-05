import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../service/share_service.dart';
import '../../../shared/constants.dart';
import '../../../shared/models/feed_item.dart';
import '../../../shared/widgets/tile.dart';
import '../home_controller.dart';

class FeedTile extends StatelessWidget {
  final FeedItem feedItem;
  final GestureTapCallback onTap;
  final HomeController controller = Modular.get();
  final ShareService shareService = Modular.get();

  FeedTile({Key key, this.feedItem, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: actionExtentRatio,
      actionPane: SlidableDrawerActionPane(),
      child: Tile(
        title: Text(feedItem.title),
        type: feedItem.type,
        points: feedItem.points,
        user: feedItem.user,
        domain: feedItem.domain,
        commentsCount: feedItem.commentsCount,
        timeAgo: feedItem.timeAgo,
        onTap: onTap,
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Bookmark',
          color: Colors.deepOrange,
          icon: MdiIcons.bookmark,
          onTap: () {
            if (feedItem.key == null) {
              controller.addBookmark(feedItem);
              Fluttertoast.showToast(
                msg: 'Bookmark added',
              );
            }
          },
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: MdiIcons.shareVariant,
          onTap: () {
            shareService.share(title: feedItem.title, url: feedItem.url);
          },
        ),
      ],
    );
  }
}
