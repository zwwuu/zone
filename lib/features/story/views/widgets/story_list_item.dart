import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/widgets/error_indicator.dart';
import 'package:zone/core/widgets/loading_indicator.dart';
import 'package:zone/features/story/providers/story_providers.dart';
import 'package:zone/features/story/views/pages/story_page.dart';
import 'package:zone/features/story/views/widgets/story_info.dart';

class StoryListItem extends ConsumerWidget {
  const StoryListItem({super.key, required this.storyId, this.index = 0});

  final int storyId;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final story = ref.watch(storyProvider(storyId));

    return story.when(
      data: (data) {
        return StoryInfo(
          story: data,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryPage(story: data),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const ErrorIndicator(message: 'Failed to load story');
      },
      loading: () {
        return const LoadingIndicator();
      },
    );
  }
}
