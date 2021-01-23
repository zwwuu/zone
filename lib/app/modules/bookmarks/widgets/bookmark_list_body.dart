import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../shared/constants.dart';
import '../../../shared/widgets/empty_indicator.dart';
import '../bookmark_controller.dart';
import 'bookmark_tile.dart';

class BookmarkListBody extends StatelessWidget {
  final BookmarkController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return controller.bookmarks.isEmpty
            ? EmptyIndicator(
                icon: MdiIcons.trayAlert,
                message: 'No bookmarks saved',
              )
            : ListView.builder(
                itemCount: controller.bookmarks.length,
                padding: const EdgeInsets.symmetric(horizontal: tileHorizontalPadding, vertical: tileVerticalPadding),
                itemBuilder: (context, index) {
                  var bookmark = controller.bookmarks[index];
                  return BookmarkTile(
                    bookmark: bookmark,
                    index: index,
                    onTap: () {
                      Modular.to.pushNamed('/item/${bookmark.id}');
                    },
                  );
                },
              );
      },
    );
  }
}
