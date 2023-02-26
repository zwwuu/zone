import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/models/item.dart';
import 'package:zone/core/utils/to_comact.dart';
import 'package:zone/core/utils/to_host.dart';
import 'package:zone/core/utils/to_relative_time.dart';

class StoryInfo extends ConsumerWidget {
  const StoryInfo({super.key, required this.story, this.index = 0, this.onTap});

  final Item story;
  final int index;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      trailing: story.url != null
          ? Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.google.com/s2/favicons?sz=256&domain_url=${story.url!}',
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
            )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (story.score != null)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 4,
              runSpacing: 4,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_upward, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      story.score!.toCompact(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [
                      const TextSpan(
                        text: 'by ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: story.deleted ? '[deleted]' : story.by,
                        style: TextStyle(
                            color: story.deleted ? Colors.grey : Colors.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          story.deleted
              ? const Text('[deleted]', style: TextStyle(color: Colors.grey))
              : Text(
                  story.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (story.url != null && story.url!.toHost().isNotEmpty) ...[
                Text(story.url!.toHost(),
                    style: const TextStyle(color: Colors.lightBlue)),
                const Text(' · '),
              ],
              Text(
                  '${story.descendants.toCompact()} ${story.descendants <= 1 ? 'comment' : 'comments'}',
                  style: const TextStyle(color: Colors.lightGreen)),
              if (story.time != null) ...[
                const Text(' · '),
                Text(story.time!.toRelativeTime(),
                    style: const TextStyle(color: Colors.grey))
              ],
            ],
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
