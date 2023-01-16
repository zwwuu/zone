import 'package:flutter/foundation.dart';

class AppConstants {
  static const String appName = 'zone';
  static const String appFullDescription =
      'zone is yet another Hacker News client. This app is developed by zwwuu. It is open source, you can find the source code on GitHub.';
  static const String appEmail = 'zwwuu@protonmail.com';
  static const String appRepo = 'https://github.com/zwwuu/zone';
  static const String appPrivacyPolice = 'https://zwwuu.github.io/zone/';
  static const String appDisclaimer =
      'zone for Hacker News is not affiliated with Y Combinator.';
  static const String bannerAdUnitId = kDebugMode
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3969090471878757/6335978524';
  static const String apiBaseUrl = 'https://hacker-news.firebaseio.com/v0';
}
