import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/constants.dart';
import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../home_controller.dart';
import 'feed_tile.dart';

class FeedListBody extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        switch (controller.feedItemsFuture.status) {
          case FutureStatus.pending:
            return LoadingIndicator();
          case FutureStatus.fulfilled:
            return RefreshIndicator(
              onRefresh: () async {
                await controller.loadFeedItems();
              },
              child: IncrementallyLoadingListView(
                loadMoreOffsetFromBottom: 2,
                padding: const EdgeInsets.symmetric(horizontal: tileHorizontalPadding, vertical: tileVerticalPadding),
                hasMore: () {
                  return controller.hasNextPage;
                },
                itemCount: () {
                  return controller.feedItems.length;
                },
                loadMore: () async {
                  await controller.loadNextPage();
                },
                itemBuilder: (context, index) {
                  final item = controller.feedItems[index];

                  if (controller.isLoadingNextPage && index == controller.feedItems.length - 1) {
                    return LinearProgressIndicator();
                  }

                  return FeedTile(
                    feedItem: item,
                    onTap: () {
                      Modular.to.pushNamed('/item/${item.id}');
                    },
                  );
                },
                physics: AlwaysScrollableScrollPhysics(),
              ),
            );
          case FutureStatus.rejected:
          default:
            return ErrorIndicator(
              onRetry: () async {
                await controller.loadFeedItems();
              },
            );
        }
      },
    );
  }
}
