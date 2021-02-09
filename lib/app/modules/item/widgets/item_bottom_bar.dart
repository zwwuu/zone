import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../service/share_service.dart';
import '../../../service/url_launch_service.dart';
import '../../../shared/constants/dimens.dart';
import '../item_controller.dart';
import 'web_view/web_view_body_controller.dart';

class ItemBottomBar extends StatelessWidget {
  final ItemController controller = Modular.get();
  final ShareService shareService = Modular.get();
  final UrlLaunchService urlLaunchService = Modular.get();
  final WebViewBodyController webViewBodyController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        var url = controller.itemFuture.value.url;
        var title = controller.itemFuture.value.title;

        return BottomAppBar(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: bottomBarHorizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (!controller.isViewingComment && controller.hasWebContent)
                  IconButton(
                    icon: Icon(MdiIcons.refresh),
                    tooltip: 'Reload current page',
                    onPressed: () {
                      webViewBodyController.reload();
                    },
                  ),
                Spacer(),
                if (controller.hasWebContent)
                  IconButton(
                    icon: controller.isViewingComment ? Icon(MdiIcons.newspaper) : Icon(MdiIcons.comment),
                    tooltip: controller.isViewingComment ? 'View Story' : 'View Comments',
                    onPressed: () {
                      controller.switchView();
                    },
                  ),
                IconButton(
                  icon: Icon(MdiIcons.web),
                  tooltip: 'Open in browser',
                  onPressed: () {
                    urlLaunchService.launchUrl(url);
                  },
                ),
                IconButton(
                  icon: Icon(MdiIcons.shareVariant),
                  onPressed: () {
                    shareService.share(title: title, url: url);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
