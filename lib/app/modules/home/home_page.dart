import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:zone/app/modules/home/widgets/option_menu_button.dart';

import 'home_controller.dart';
import 'widgets/dropdown_feed_select.dart';
import 'widgets/feed_bottom_bar.dart';
import 'widgets/feed_list_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    setupReactions();
    controller.loadFeedItems();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  void setupReactions() {
    _disposer = reaction((_) => controller.feedType, (_) {
      controller.loadFeedItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownFeedSelect(),
        actions: [OptionMenuButton()],
      ),
      body: FeedListBody(),
      bottomNavigationBar: FeedBottomBar(),
    );
  }
}
