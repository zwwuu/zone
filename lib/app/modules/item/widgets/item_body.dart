import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../item_controller.dart';
import 'comment_view/comment_view_body.dart';
import 'web_view/web_view_body.dart';

class ItemBody extends StatelessWidget {
  final ItemController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        switch (controller.itemFuture.status) {
          case FutureStatus.pending:
            return LoadingIndicator();
          case FutureStatus.fulfilled:
            var item = controller.itemFuture.value;

            return SafeArea(
              child: !controller.hasWebContent
                  ? CommentViewBody(
                      item: item,
                    )
                  : controller.isViewingComment
                      ? CommentViewBody(
                          item: item,
                        )
                      : WebViewBody(
                          url: item.url,
                        ),
            );
          case FutureStatus.rejected:
          default:
            return ErrorIndicator(
              onRetry: () async {
                await controller.reloadItem();
              },
            );
        }
      },
    );
  }
}
