import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/models/item.dart';
import 'comment_tile.dart';

class CommentList extends StatelessWidget {
  final Item item;

  const CommentList({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      itemCount: children.length,
      itemBuilder: (context, index) {
        return commentTree[index];
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: dividerThickness,
        );
      },
    );
  }
}
