import 'package:flutter/material.dart';

import '../../../util/subtitle_formatter.dart';

class ItemTileSubtitle extends StatelessWidget {
  final String user;
  final String domain;
  final int commentsCount;
  final String timeAgo;

  const ItemTileSubtitle({
    Key key,
    this.user,
    this.domain,
    this.commentsCount,
    this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          SubtitleFormatter.buildUserText(user),
          SubtitleFormatter.buildUrlText(domain),
          SubtitleFormatter.buildCommentCountText(commentsCount),
          TextSpan(
            text: '$timeAgo',
          ),
        ],
      ),
    );
  }
}
