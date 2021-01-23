import 'package:flutter/material.dart';

import '../util/subtitle_formatter.dart';

class TileSubtitle extends StatelessWidget {
  final String user;
  final String domain;
  final int commentsCount;
  final String timeAgo;
  final int time;

  const TileSubtitle({
    Key key,
    this.user,
    this.domain,
    this.commentsCount,
    this.timeAgo,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          SubtitleFormatter.buildUserText(user),
          SubtitleFormatter.buildDomainText(domain),
          SubtitleFormatter.buildCommentCountText(commentsCount),
          timeAgo == null ? SubtitleFormatter.buildTimeText(time) : SubtitleFormatter.buildTimeAgoText(timeAgo)
        ],
      ),
    );
  }
}
