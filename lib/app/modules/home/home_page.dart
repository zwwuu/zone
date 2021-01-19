import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/feed_type.dart';
import '../../shared/util/extensions.dart';
import '../../shared/util/url.dart';
import '../../shared/widgets/item_tile/item_tile.dart';
import '../../shared/widgets/loading_indicator.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  ReactionDisposer _disposer;

  final ScrollController _scrollController = ScrollController();
  final SlidableController _slidableController = SlidableController();

  @override
  void initState() {
    super.initState();
    setupReactions();
    controller.loadFeedItems();
  }

  @override
  void dispose() {
    _disposer();
    _scrollController.dispose();
    super.dispose();
  }

  void setupReactions() {
    _disposer = reaction((_) => controller.feedType, (_) {
      controller.loadFeedItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.feedType.name,
                  icon: Icon(
                    MdiIcons.chevronDown,
                  ),
                  onChanged: (newValue) {
                    controller.feedType = newValue.parseFeedType();
                  },
                  items: FeedType.values.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(
                        value.name.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          body: _buildFeedList(),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Zone - Hacker News',
                    ),
                    onTap: () {
                      _scrollController.animateTo(
                        0,
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 200),
                      );
                    },
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
          ),
        );
      },
    );
  }

  Widget _buildFeedList() {
    final feedItemsFuture = controller.feedItemsFuture;

    switch (feedItemsFuture.status) {
      case FutureStatus.pending:
        return LoadingIndicator();
      case FutureStatus.fulfilled:
        return RefreshIndicator(
          onRefresh: () async {
            await controller.loadFeedItems();
          },
          child: IncrementallyLoadingListView(
            controller: _scrollController,
            loadMoreOffsetFromBottom: 2,
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

              return Column(
                children: [
                  Slidable(
                    key: Key(item.id.toString()),
                    controller: _slidableController,
                    actionExtentRatio: 0.2,
                    actionPane: SlidableDrawerActionPane(),
                    child: ItemTile(
                      title: item.title,
                      user: item.user,
                      points: item.points,
                      domain: item.domain,
                      commentsCount: item.commentsCount,
                      timeAgo: item.timeAgo,
                      onTap: () {
                        Modular.to.pushNamed('/item/${item.id}');
                      },
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Bookmark',
                        color: Colors.deepOrange,
                        icon: MdiIcons.bookmark,
                        onTap: () {
                          if (item.key == null) {
                            controller.addBookmark(item);
                            Fluttertoast.showToast(
                              msg: 'Bookmark added',
                            );
                          }
                        },
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: MdiIcons.shareVariant,
                        onTap: () {
                          UrlUtil().share(title: item.title, url: item.url);
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(2),
          ),
        );
      case FutureStatus.rejected:
      default:
        return Container(
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
                    await controller.loadFeedItems();
                  },
                )
              ],
            ),
          ),
        );
    }
  }
}
