import 'package:flutter/material.dart';
import 'package:zone/core/models/item.dart';
import 'package:zone/core/models/item_type.dart';
import 'package:zone/core/widgets/html_content.dart';
import 'package:zone/features/comment/views/widgets/comment_list.dart';
import 'package:zone/features/story/views/widgets/story_actions.dart';
import 'package:zone/features/story/views/widgets/story_info.dart';
import 'package:zone/features/story/views/widgets/story_poll.dart';
import 'package:zone/features/story/views/widgets/story_webview.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key, required this.story});

  final Item story;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StoryInfo(story: story),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    if (story.deleted) ...[
                      const Text('[deleted]',
                          style: TextStyle(color: Colors.grey)),
                    ] else if (story.text.isNotEmpty)
                      HtmlContent(
                          html: story.text,
                          textStyle: Theme.of(context).textTheme.bodyLarge),
                    if (story.type == ItemType.poll) const StoryPoll(),
                    StoryActions(story: story),
                  ],
                ),
              ),
              CommentList(commentIds: story.kids, by: story.by)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'View story',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryWebview(
                    url: story.url ??
                        'https://news.ycombinator.com/item?id=${story.id}'),
              ),
            );
          },
          child: const Icon(Icons.newspaper),
        ),
      ),
    );
  }
}
