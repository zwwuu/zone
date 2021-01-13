import 'package:flutter/material.dart';
import 'package:hnpwa_client/hnpwa_client.dart';

import '../../../../shared/widgets/item_tile/item_tile.dart';
import 'comment_tile.dart';

class Comment extends StatelessWidget {
  final Item item;

  const Comment({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTile(
          title: item.title,
          user: item.user,
          points: item.points,
          domain: item.domain,
          commentsCount: item.commentsCount,
          timeAgo: item.timeAgo,
        ),
        Divider(
          thickness: 2,
        ),
        Expanded(
          child: item.commentsCount == 0
              ? Center(
                  child: Text(
                    "No comments",
                  ),
                )
              : _buildCommentList(item),
        ),
      ],
    );
  }

  Widget _buildCommentList(Item item) {
    final children = <Widget>[];
    final commentTree = item.comments.map((commentItem) {
      return CommentTile(
        user: commentItem.user,
        content: commentItem.content,
        timeAgo: commentItem.timeAgo,
        comments: commentItem.comments,
        depth: 0,
      );
    }).toList();

    children.addAll(commentTree);

    return ListView.separated(
      itemBuilder: (context, index) {
        return commentTree[index];
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
        );
      },
      itemCount: children.length,
    );
  }
}
