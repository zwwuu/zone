import 'package:flutter/foundation.dart';

import '../models/feed_type.dart';

extension FeedTypeExtension on FeedType {
  String get name {
    return describeEnum(this);
  }
}

extension StringExtension on String {
  FeedType parseFeedType() {
    assert(this != null || isNotEmpty);

    return FeedType.values.firstWhere((feedType) {
      return feedType.name == toLowerCase();
    });
  }

  bool isNullOrEmpty() {
    return this == null || isEmpty;
  }

  String toUrl() {
    var urlPattern = r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';
    var match = RegExp(urlPattern, caseSensitive: false).firstMatch(this);
    return match != null ? this : 'https://news.ycombinator.com/$this';
  }
}
