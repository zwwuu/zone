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

  @action
  Future<void> loadBookmarks() async {
    bookmarks.addAll(await _bookmarksRepository.getAll());
  }

  @action
  Future<void> deleteBookmark(FeedItem feedItem) async {
    await _bookmarksRepository.delete(feedItem.key);
    bookmarks.remove(feedItem);
  }
}
