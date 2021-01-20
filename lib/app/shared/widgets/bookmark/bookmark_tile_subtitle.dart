import 'package:flutter/material.dart';

import '../../util/subtitle_formatter.dart';

class BookmarkTileSubtitle extends StatelessWidget {
  final String user;
  final String domain;
  final int commentsCount;
  final int time;

  const BookmarkTileSubtitle({
    Key key,
    this.user,
    this.domain,
    this.commentsCount,
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
          SubtitleFormatter.buildTimeText(time)
        ],
      ),
    );
  }
}
