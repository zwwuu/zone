import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'web_view_body_controller.dart';

class WebViewBody extends StatelessWidget {
  final WebViewBodyController controller = Modular.get();

  final String url;

  WebViewBody({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Stack(
          children: [
            InAppWebView(
              initialUrl: url,
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                  forceDark: AndroidForceDark.FORCE_DARK_ON,
                ),
              ),
              onWebViewCreated: (webViewController) {
                controller.webViewController = webViewController;
              },
              onLoadStart: (_, __) {
                controller.isLoadingWebContent = true;
              },
              onLoadStop: (_, __) {
                controller.isLoadingWebContent = false;
              },
            ),
            if (controller.isLoadingWebContent) LinearProgressIndicator(),
          ],
        );
      },
    );
  }
}
