import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/feed_item.dart';
import '../../shared/repositories/bookmark_repository.dart';

part 'bookmark_controller.g.dart';

@Injectable()
class BookmarkController = _BookmarksControllerBase with _$BookmarkController;

abstract class _BookmarksControllerBase with Store {
  final BookmarkRepository _bookmarksRepository = Modular.get();

  _BookmarksControllerBase();

  @observable
  ObservableList<FeedItem> bookmarks = ObservableList<FeedItem>();

  List<FeedItem> marked = [];

  @action
  Future<void> loadBookmarks() async {
    bookmarks.addAll(await _bookmarksRepository.getAll());
  }

  @action
  Future<void> deleteBookmark(FeedItem feedItem) async {
    marked.add(feedItem);
    bookmarks.remove(feedItem);
  }

  @action
  Future<void> undoDelete(int index, FeedItem feedItem) async {
    marked.remove(feedItem);
    bookmarks.insert(index, feedItem);
  }

  Future<void> deleteMarked() async {
    for (var item in marked) {
      await _bookmarksRepository.delete(item.key);
    }
  }
}
