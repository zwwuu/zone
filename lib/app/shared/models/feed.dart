import 'feed_item.dart';

class Feed {
  final List<FeedItem> items;
  final int currentPage;
  final bool hasNextPage;

  Feed({this.items, this.currentPage, this.hasNextPage});

  factory Feed.from({
    List<FeedItem> feedItems,
    int currentPage,
    bool hasNextPage,
  }) {
    return Feed(
      items: feedItems,
      currentPage: currentPage,
      hasNextPage: hasNextPage,
    );
  }
}
