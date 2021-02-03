import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/models/feed.dart';
import '../../../shared/models/feed_item.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository extends Disposable {
  final Dio _client;

  HomeRepository(this._client);

  Future<Feed> top({int page = 1}) {
    return _fetchFeed(
      url: '/news?page=$page',
      currentPage: page,
      maxPages: 10,
    );
  }

  Future<Feed> newest({int page = 1}) {
    return _fetchFeed(
      url: '/newest?page=$page',
      currentPage: page,
      maxPages: 12,
    );
  }

  Future<Feed> best({int page = 1}) {
    return _fetchFeed(
      url: '/best?page=$page',
      currentPage: page,
      maxPages: 7,
    );
  }

  Future<Feed> ask({int page = 1}) {
    return _fetchFeed(
      url: '/ask?page=$page',
      currentPage: page,
      maxPages: 2,
    );
  }

  Future<Feed> show({int page = 1}) {
    return _fetchFeed(
      url: '/show?page=$page',
      currentPage: page,
      maxPages: 2,
    );
  }

  Future<Feed> jobs({int page = 1}) {
    return _fetchFeed(
      url: '/jobs?page=1',
      currentPage: 1,
      maxPages: 2,
    );
  }

  Future<Feed> _fetchFeed({String url, int currentPage, int maxPages}) async {
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return Feed.from(
        feedItems: List.generate(response.data.length, (index) => FeedItem.fromJson(response.data[index])),
        currentPage: currentPage,
        hasNextPage: currentPage != maxPages,
      );
    } else {
      throw Exception(
        'Error Fetching Results: ${response.statusCode}',
      );
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
