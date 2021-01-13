import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewStack extends StatefulWidget {
  final String url;

  WebViewStack({Key key, this.url}) : super(key: key);

  @override
  WebViewStackState createState() => WebViewStackState();
}

class WebViewStackState extends State<WebViewStack> {
  InAppWebViewController _webViewController;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrl: widget.url,
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              forceDark: AndroidForceDark.FORCE_DARK_ON,
            ),
          ),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onLoadStart: (_, __) {
            setState(() {
              _isLoading = true;
            });
          },
          onLoadStop: (_, __) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
        _isLoading ? LinearProgressIndicator() : Stack(),
      ],
    );
  }

  void reload() {
    _webViewController?.reload();
  }
}
