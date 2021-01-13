import 'package:flutter/foundation.dart';

enum FeedType { top, newest, ask, show, job }

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
    }, orElse: () => null);
  }
}
