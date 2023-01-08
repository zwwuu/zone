import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/core/models/item.dart';
import 'package:zone/core/repository/item_repository.dart';

final commentRepositoryProvider = Provider((ref) => ItemRepository());

final commentProvider =
    FutureProvider.family<Item, int>((ref, commentId) async {
  final repo = ref.watch(commentRepositoryProvider);
  final comment = await repo.getItem(id: commentId);

  return comment;
});

final commentsCollapsedListProvider =
    StateNotifierProvider.autoDispose<CommentNotifier, List<int>>(
  (ref) {
    return CommentNotifier();
  },
);

class CommentNotifier extends StateNotifier<List<int>> {
  CommentNotifier() : super([]);
  final List<int> _collapsedComments = [];

  get collapsedComments => _collapsedComments;

  void toggleCollapsed(int id) {
    if (state.contains(id)) {
      state = state.where((element) => element != id).toList();
    } else {
      state = [...state, id];
    }
  }

  void clear() {
    state = [];
  }
}
