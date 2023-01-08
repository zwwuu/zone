import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StoryWebview extends StatefulWidget {
  const StoryWebview({super.key, required this.url});

  final String url;

  @override
  State<StoryWebview> createState() => _StoryWebviewState();
}

class _StoryWebviewState extends State<StoryWebview> {
  late final WebViewController? _webViewController;
  final _webViewKey = GlobalKey();
  bool _isPdf = false;

  @override
  void initState() {
    super.initState();
    if (widget.url.endsWith('.pdf')) {
      _isPdf = true;
      return;
    }

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: _isPdf
            ? SfPdfViewer.network(widget.url)
            : WebViewWidget(
                key: _webViewKey,
                controller: _webViewController!,
              ),
      ),
    );
  }
}
