import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zone/core/models/item.dart';
import 'package:zone/features/bookmark/models/bookmark.dart';
import 'package:zone/features/bookmark/providers/bookmark_providers.dart';
import 'package:zone/features/story/providers/story_providers.dart';

class StoryActions extends ConsumerWidget {
  const StoryActions({super.key, required this.story});

  final Item story;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookmarkProvider(story.id));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        bookmark.when(
          data: (data) {
            return IconButton(
              tooltip: 'Bookmark',
              icon: data
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_outline),
              onPressed: () async {
                if (data) {
                  await ref
                      .read(bookmarkProvider(story.id).notifier)
                      .deleteBookmark(story.id);
                } else {
                  await ref
                      .read(bookmarkProvider(story.id).notifier)
                      .addBookmark(Bookmark(
                          id: story.id,
                          type: story.type,
                          createdAt: DateTime.now()));
                }
              },
            );
          },
          loading: () => const IconButton(
            tooltip: 'Bookmark',
            icon: Icon(Icons.bookmark),
            onPressed: null,
          ),
          error: (error, stack) => const IconButton(
            tooltip: 'Fail to load bookmark status',
            icon: Icon(Icons.bookmark_border),
            onPressed: null,
          ),
        ),
        IconButton(
          onPressed: () async {
            if (story.url == null) {
              final url = 'https://news.ycombinator.com/item?id=${story.id}';
              if (await canLaunchUrlString(url)) {
                await launchUrlString(url);
              }
            } else {
              if (await canLaunchUrlString(story.url!)) {
                await launchUrlString(story.url!);
              }
            }
          },
          tooltip: 'Open in external browser',
          icon: const Icon(Icons.open_in_browser),
        ),
        IconButton(
          onPressed: () {
            Share.share(story.url ??
                'https://news.ycombinator.com/item?id=${story.id}');
          },
          icon: const Icon(Icons.share),
          tooltip: 'Share',
        ),
        IconButton(
          onPressed: () {
            ref.invalidate(storyProvider(story.id));
          },
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh',
        ),
      ],
    );
  }
}
