import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/widgets/empty_indicator.dart';
import 'package:zone/core/widgets/full_error_indicator.dart';
import 'package:zone/features/bookmark/providers/bookmark_providers.dart';
import 'package:zone/features/story/views/widgets/story_list_item.dart';

class BookmarkList extends ConsumerWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkListProvider);

    return bookmarks.when(
      data: (data) {
        return data.isEmpty
            ? const EmptyIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return StoryListItem(storyId: data[index].id);
                },
              );
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stackTrace) =>
          const FullErrorIndicator(message: 'Failed to load bookmarks'),
    );
  }
}
