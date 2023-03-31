import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/models/item.dart';
import 'package:zone/core/utils/to_relative_time.dart';
import 'package:zone/core/widgets/error_indicator.dart';
import 'package:zone/core/widgets/html_content.dart';
import 'package:zone/core/widgets/loading_indicator.dart';
import 'package:zone/features/comment/providers/comment_providers.dart';

class CommentListItem extends ConsumerStatefulWidget {
  const CommentListItem(
      {super.key,
      required this.comment,
      required this.depth,
      required this.storyBy});

  final Item comment;
  final String storyBy;
  final int depth;

  @override
  ConsumerState<CommentListItem> createState() => _CommentListItemState();
}

class _CommentListItemState extends ConsumerState<CommentListItem> {
  Color _getIndentColor(int depth) {
    final colors = [
      Colors.white,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.cyan,
      Colors.red,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.blue,
    ];
    return colors[depth % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final collapsedComments = ref.watch(commentsCollapsedListProvider);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: widget.depth * 8),
          child: ListTile(
            shape: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
                left: widget.depth > 0
                    ? BorderSide(
                        width: 4,
                        color: _getIndentColor(widget.depth),
                      )
                    : BorderSide.none),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                          text: widget.comment.deleted
                              ? '[delete]'
                              : widget.comment.by,
                          style: widget.comment.deleted
                              ? const TextStyle(color: Colors.grey)
                              : widget.storyBy == widget.comment.by
                                  ? const TextStyle(color: Colors.orange)
                                  : null),
                      if (widget.comment.time != null) ...[
                        const TextSpan(text: ' · '),
                        TextSpan(
                            text: widget.comment.time!.toRelativeTime(),
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ],
                  ),
                ),
                if (collapsedComments.contains(widget.comment.id))
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _getIndentColor(widget.depth).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('+ ${widget.comment.kids.length}'),
                  ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: widget.comment.deleted
                  ? const Text('[deleted]',
                      style: TextStyle(color: Colors.grey))
                  : HtmlContent(
                      html: widget.comment.text,
                      textStyle: Theme.of(context).textTheme.bodyMedium),
            ),
            onTap: () {
              if (widget.comment.kids.isNotEmpty) {
                ref
                    .read(commentsCollapsedListProvider.notifier)
                    .toggleCollapsed(widget.comment.id);
              }
            },
          ),
        ),
        ...(widget.comment.kids.map((commentId) {
          final comment = ref.watch(commentProvider(commentId));
          return comment.when(
            data: (data) {
              return collapsedComments.contains(widget.comment.id)
                  ? const SizedBox.shrink()
                  : CommentListItem(
                      comment: data,
                      depth: widget.depth + 1,
                      storyBy: widget.storyBy,
                    );
            },
            loading: () {
              return const LoadingIndicator();
            },
            error: (error, stackTrace) {
              return const ErrorIndicator(message: 'Failed to load comment');
            },
          );
        }).toList())
      ],
    );
  }
}
