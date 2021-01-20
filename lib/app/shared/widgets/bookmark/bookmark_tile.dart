import 'package:flutter/material.dart';

import '../../models/item_type.dart';
import 'bookmark_tile_icon.dart';
import 'bookmark_tile_subtitle.dart';

class BookmarkTile extends StatelessWidget {
  final String user;
  final String domain;
  final int time;
  final String title;
  final ItemType type;
  final GestureTapCallback onTap;

  const BookmarkTile({
    Key key,
    this.user,
    this.domain,
    this.title,
    this.time,
    this.onTap,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        title: Text(
          title,
        ),
        leading: BookmarkTileIcon(type: type),
        subtitle: BookmarkTileSubtitle(
          user: user,
          domain: domain,
          time: time,
        ),
        onTap: onTap,
      ),
    );
  }
}
