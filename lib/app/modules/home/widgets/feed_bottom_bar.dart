import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../shared/constants.dart';
import '../home_controller.dart';

class FeedBottomBar extends StatelessWidget {
  final HomeController controller = Modular.get();

  FeedBottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: bottomBarHorizontalPadding),
        child: Row(
          children: <Widget>[
            Text(
              'Zone - Hacker News',
            ),
            Spacer(),
            IconButton(
              icon: Icon(MdiIcons.bookmark),
              tooltip: 'Bookmarks',
              onPressed: () {
                Modular.to.pushNamed('/bookmarks');
              },
            ),
            IconButton(
              icon: Icon(MdiIcons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                controller.loadFeedItems();
              },
            ),
          ],
        ),
      ),
    );
  }
}
