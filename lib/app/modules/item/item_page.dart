import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../shared/util/url.dart';
import '../../shared/widgets/loading_indicator.dart';
import 'item_controller.dart';
import 'widgets/comment/comment.dart';
import 'widgets/webview_stack/webview_stack.dart';

class ItemPage extends StatefulWidget {
  final String id;

  const ItemPage({Key key, this.id}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemController> {
  final _webViewKey = GlobalKey<WebViewStackState>();

  @override
  void initState() {
    super.initState();
    controller.loadItem(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        var isViewingComment = controller.isViewingComment;
        var itemFuture = controller.itemFuture;

        switch (itemFuture.status) {
          case FutureStatus.pending:
            return Scaffold(
              body: LoadingIndicator(),
            );
          case FutureStatus.fulfilled:
            var item = itemFuture.value;
            var hasWebContent = Uri.parse(item.url).isAbsolute;

            return Scaffold(
              body: SafeArea(
                child: !hasWebContent
                    ? Comment(
                        item: item,
                      )
                    : isViewingComment
                        ? Comment(
                            item: item,
                          )
                        : WebViewStack(
                            key: _webViewKey,
                            url: item.url,
                          ),
              ),
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      if (!isViewingComment)
                        IconButton(
                          icon: Icon(MdiIcons.refresh),
                          tooltip: 'Reload current page',
                          onPressed: () {
                            _webViewKey.currentState?.reload();
                          },
                        ),
                      Spacer(),
                      if (hasWebContent)
                        IconButton(
                          icon: isViewingComment ? Icon(MdiIcons.bookOpenBlankVariant) : Icon(MdiIcons.comment),
                          tooltip: 'Comments',
                          onPressed: () {
                            controller.switchView();
                          },
                        ),
                      IconButton(
                        icon: Icon(MdiIcons.web),
                        tooltip: 'Open in browser',
                        onPressed: () async {
                          await UrlUtil().launchUrl(item.url);
                        },
                      ),
                      IconButton(
                        icon: Icon(MdiIcons.shareVariant),
                        onPressed: () {
                          UrlUtil().share(title: item.title, url: item.url);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          case FutureStatus.rejected:
          default:
            return Scaffold(
              body: Container(
                child: Center(
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 20,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text('Oops something went wrong'),
                      RaisedButton.icon(
                        icon: Icon(MdiIcons.refresh),
                        label: Text('Retry'),
                        onPressed: () async {
                          await controller.loadItem(widget.id);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
