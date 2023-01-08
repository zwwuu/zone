import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/widgets/full_error_indicator.dart';
import 'package:zone/features/story/models/stories_type.dart';
import 'package:zone/features/story/providers/story_providers.dart';
import 'package:zone/features/story/views/widgets/story_list_item.dart';

class StoryList extends ConsumerWidget {
  const StoryList({super.key, required this.storiesType});

  final StoriesType storiesType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyList = ref.watch(storyListProvider(storiesType));

    return RefreshIndicator(
      onRefresh: () async {
        return await ref.refresh(storyListProvider(storiesType).future);
      },
      child: storyList.when(
        data: (stories) {
          return ListView.builder(
            padding:
                const EdgeInsets.only(bottom: kBottomNavigationBarHeight * 2),
            itemCount: stories.length,
            itemBuilder: (BuildContext context, int index) {
              return StoryListItem(storyId: stories[index], index: index);
            },
          );
        },
        error: (error, stackTrace) {
          return const FullErrorIndicator();
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
