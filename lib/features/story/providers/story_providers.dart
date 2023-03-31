import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/models/item.dart';
import 'package:zone/features/story/models/stories_type.dart';
import 'package:zone/features/story/repository/story_repository.dart';

final storyRepositoryProvider =
    Provider<StoryRepository>((ref) => StoryRepository());

final storyListProvider =
    FutureProvider.family<List<int>, StoriesType>((ref, storiesType) async {
  final repo = ref.watch(storyRepositoryProvider);
  final storyList = await repo.getStories(storiesType: storiesType);

  return storyList;
});

final storyProvider = FutureProvider.family<Item, int>((ref, storyId) async {
  final storyRepository = ref.watch(storyRepositoryProvider);
  final story = await storyRepository.getItem(id: storyId);

  return story;
});
