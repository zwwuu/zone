import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/feed_item.dart';
import '../../shared/models/feed_type.dart';
import '../../shared/repositories/bookmark_repository.dart';
import 'repository/home_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _repository;
  final BookmarkRepository _bookmarksRepository = Modular.get();
  final SlidableController slidableController = SlidableController();

  int _currentPage = 1;
  List<FeedItem> feedItems = [];

  @observable
  FeedType feedType = FeedType.top;

  @observable
  bool hasNextPage = false;

  @observable
  ObservableFuture feedItemsFuture;

  @observable
  bool isLoadingNextPage = false;

  _HomeControllerBase(this._repository);

  @action
  Future<void> loadFeedItems() async {
    feedItems.clear();
    _currentPage = 1;
    var future = ObservableFuture<void>(loadNextPage());

    feedItemsFuture = future;
  }

  @action
  Future<void> loadNextPage() async {
    if (isLoadingNextPage || (_currentPage > 1 && !hasNextPage)) {
      return;
    }

    try {
      isLoadingNextPage = true;
      var feed;
      switch (feedType) {
        case FeedType.top:
          feed = await _repository.top(page: _currentPage);
          break;
        case FeedType.newest:
          feed = await _repository.newest(page: _currentPage);
          break;
        case FeedType.best:
          feed = await _repository.best(page: _currentPage);
          break;
        case FeedType.ask:
          feed = await _repository.ask(page: _currentPage);
          break;
        case FeedType.show:
          feed = await _repository.show(page: _currentPage);
          break;
        case FeedType.job:
          feed = await _repository.jobs();
          break;
      }

      feedItems.addAll(feed.items);
      hasNextPage = feed.hasNextPage;
      _currentPage++;
    } finally {
      isLoadingNextPage = false;
    }
  }

  void addBookmark(FeedItem item) {
    _bookmarksRepository.add(item);
  }
}
