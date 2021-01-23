import 'package:flutter/material.dart';

import '../models/item_type.dart';
import 'tile_icon.dart';
import 'tile_points.dart';
import 'tile_subtitle.dart';

class Tile extends StatelessWidget {
  final Widget title;
  final int points;
  final String user;
  final ItemType type;
  final String domain;
  final int commentsCount;
  final String timeAgo;
  final int time;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final bool includeLeadingIcon;

  const Tile({
    Key key,
    this.title,
    this.points,
    this.user,
    this.type,
    this.domain,
    this.commentsCount,
    this.timeAgo,
    this.time,
    this.onTap,
    this.onLongPress,
    this.includeLeadingIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: includeLeadingIcon
          ? points == null
              ? TileIcon(type: type)
              : TilePoints(points: points)
          : null,
      subtitle: TileSubtitle(
        user: user,
        domain: domain,
        commentsCount: commentsCount,
        timeAgo: timeAgo,
        time: time,
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
