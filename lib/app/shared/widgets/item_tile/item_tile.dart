import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/item_type.dart';
import 'item_tile_subtitle.dart';

class ItemTile extends StatelessWidget {
  final String user;
  final String domain;
  final int commentsCount;
  final String timeAgo;
  final int time;
  final String title;
  final int points;
  final ItemType type;
  final GestureTapCallback onTap;

  const ItemTile({
    Key key,
    this.user,
    this.domain,
    this.commentsCount,
    this.timeAgo,
    this.title,
    this.points,
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
        leading: _buildLeading(points),
        subtitle: ItemTileSubtitle(
          user: user,
          domain: domain,
          commentsCount: commentsCount,
          timeAgo: timeAgo,
          time: time,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLeading(int points) {
    return points == null
        ? Icon(
            MdiIcons.briefcase,
            color: Colors.orange,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$points',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                MdiIcons.fire,
                color: Colors.red,
              ),
            ],
          );
  }
}
