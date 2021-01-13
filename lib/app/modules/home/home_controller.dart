import 'package:flutter_modular/flutter_modular.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/feed_type.dart';
import 'repository/home_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _repository;

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
    try {
      if (isLoadingNextPage || (_currentPage > 1 && !hasNextPage)) {
        return;
      }

      isLoadingNextPage = true;
      var feed = await _repository.fetchItemFeed(feedType: feedType, page: _currentPage);
      feedItems.addAll(feed.items);
      hasNextPage = feed.hasNextPage;
      _currentPage++;
    } finally {
      isLoadingNextPage = false;
    }
  }
}
