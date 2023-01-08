import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:zone/features/bookmark/models/bookmark.dart';
import 'package:zone/features/bookmark/repositories/bookmark_repository.dart';

final isarProvider = Provider<Isar>((ref) {
  return Isar.openSync([BookmarkSchema]);
});

final bookmarkRepositoryProvider = Provider<BookmarkRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return BookmarkRepository(isar: isar);
});

final bookmarkProvider =
    StateNotifierProvider.family<BookmarkNotifier, AsyncValue<bool>, int>(
        (ref, bookmarkId) {
  final repository = ref.watch(bookmarkRepositoryProvider);
  return BookmarkNotifier(repository: repository, bookmarkId: bookmarkId);
});

class BookmarkNotifier extends StateNotifier<AsyncValue<bool>> {
  final BookmarkRepository repository;
  final int bookmarkId;

  BookmarkNotifier({required this.repository, required this.bookmarkId})
      : super(const AsyncValue.loading()) {
    getBookmark(bookmarkId);
  }

  Future getBookmark(int id) async {
    final bookmark = await repository.getBookmark(id);
    state = AsyncValue.data(bookmark != null);
  }

  Future addBookmark(Bookmark bookmark) async {
    await repository.addBookmark(bookmark);
    state = const AsyncValue.data(true);
  }

  Future deleteBookmark(int bookmarkId) async {
    final res = await repository.deleteBookmark(bookmarkId);
    if (res) {
      state = const AsyncValue.data(false);
    }
  }
}

final bookmarkListProvider = StreamProvider<List<Bookmark>>((ref) async* {
  final repo = ref.watch(bookmarkRepositoryProvider);
  yield* repo.watchBookmarks();
});
