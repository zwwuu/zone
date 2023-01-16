import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:zone/core/config/app_constants.dart';
import 'package:zone/core/widgets/app_about_dialog.dart';
import 'package:zone/features/bookmark/views/pages/bookmarks_page.dart';
import 'package:zone/features/story/models/stories_type.dart';
import 'package:zone/features/story/views/widgets/story_list.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      BannerAd(
        adUnitId: AppConstants.bannerAdUnitId,
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _bannerAd = ad as BannerAd;
            });
          },
          onAdFailedToLoad: (ad, err) {
            ad.dispose();
          },
        ),
      ).load();
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: StoriesType.values.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabs: StoriesType.values.map((StoriesType storiesType) {
                  return Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(storiesType.icon),
                        const SizedBox(width: 8),
                        Text(storiesType.name),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Expanded(
                child: Stack(
                  children: [
                    TabBarView(
                      children:
                          StoriesType.values.map((StoriesType storiesType) {
                        return StoryList(
                            key: PageStorageKey(storiesType),
                            storiesType: storiesType);
                      }).toList(),
                    ),
                    if (_bannerAd != null)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.grey.withOpacity(0.3),
                          width: _bannerAd!.size.width.toDouble(),
                          height: _bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd!),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                const Text(AppConstants.appName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.bookmark),
                  tooltip: 'Bookmarks',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookmarksPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.info),
                  tooltip: 'about',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AppAboutDialog(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
