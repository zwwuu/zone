import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/models/item.dart';
import '../../../../shared/widgets/empty_indicator.dart';
import '../../../../shared/widgets/tile.dart';
import 'comment_list.dart';
import 'item_content.dart';

class CommentViewBody extends StatelessWidget {
  final Item item;

  const CommentViewBody({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tile(
          title: Text(item.title),
          user: item.user,
          points: item.points,
          domain: item.domain,
          commentsCount: item.commentsCount,
          timeAgo: item.timeAgo,
        ),
        if (item.content != null) ItemContent(content: item.content),
        Divider(
          thickness: dividerThickness,
        ),
        Expanded(
          child: item.commentsCount == 0
              ? EmptyIndicator(
                  icon: MdiIcons.commentAlert,
                  message: 'No comments',
                )
              : CommentList(item: item),
        ),
      ],
    );
  }
}
