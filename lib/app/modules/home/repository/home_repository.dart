import 'package:flutter_modular/flutter_modular.dart';
import 'package:hnpwa_client/hnpwa_client.dart';

import '../../../shared/models/feed_type.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository extends Disposable {
  final HnpwaClient _hnpwaClient;

  HomeRepository(this._hnpwaClient);

  Future<Feed> fetchItemFeed({FeedType feedType = FeedType.top, int page = 1}) async {
    Feed feed;

    switch (feedType) {
      case FeedType.newest:
        feed = await _hnpwaClient.newest(page: 1);
        break;
      case FeedType.ask:
        feed = await _hnpwaClient.ask(page: page);
        break;
      case FeedType.show:
        feed = await _hnpwaClient.show(page: page);
        break;
      case FeedType.job:
        feed = await _hnpwaClient.jobs();
        break;
      case FeedType.top:
      default:
        feed = await _hnpwaClient.news(page: page);
        break;
    }

    return feed;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
