import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/widgets/full_error_indicator.dart';
import 'package:zone/features/comment/providers/comment_providers.dart';
import 'package:zone/features/comment/views/widgets/comment_list_item.dart';

class CommentList extends ConsumerWidget {
  const CommentList({super.key, required this.commentIds, required this.by});

  final List<int> commentIds;
  final String by;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: commentIds.map((commentId) {
          final comment = ref.watch(commentProvider(commentId));

          return comment.when(
            data: (data) {
              return CommentListItem(comment: data, depth: 0, storyBy: by);
            },
            loading: () {
              return const SizedBox.shrink();
            },
            error: (error, stackTrace) {
              return const FullErrorIndicator();
            },
          );
        }).toList());
  }
}
