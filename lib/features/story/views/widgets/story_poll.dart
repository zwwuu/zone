import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zone/core/utils/to_comact.dart';
import 'package:zone/features/story/providers/story_providers.dart';

class StoryPoll extends ConsumerWidget {
  const StoryPoll({super.key, this.partIds = const [126810, 126811, 126812]});

  final List<int> partIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: partIds.map((partId) {
        final pollPart = ref.watch(storyProvider(partId));
        return pollPart.when(
          data: (data) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(data.text),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      size: 12,
                    ),
                    Text(data.score == null ? '0' : data.score!.toCompact()),
                  ],
                ),
              ),
            );
          },
          loading: () {
            return Shimmer.fromColors(
              baseColor: Theme.of(context).scaffoldBackgroundColor,
              highlightColor: Theme.of(context).dividerColor,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 16,
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Failed to load poll'),
            );
          },
        );
      }).toList(),
    );
  }
}
