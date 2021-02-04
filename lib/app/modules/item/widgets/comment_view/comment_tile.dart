import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';

import '../../../../shared/models/item.dart';
import '../../../../shared/util/url.dart';
import '../../../../shared/widgets/tile.dart';

class CommentTile extends StatelessWidget {
  final List<Item> comments;
  final int depth;
  final String content;
  final String user;
  final String timeAgo;

  CommentTile({this.comments, this.depth, this.user, this.content, this.timeAgo});

  @override
  Widget build(BuildContext context) {
    final commentList = <Widget>[
      Container(
        margin: EdgeInsets.only(left: (depth + 1) * 3.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 2,
              color: _getBorderColor(depth),
            ),
          ),
        ),
        child: Tile(
          title: Html(
            data: content,
            style: {
              'body': Style(margin: EdgeInsets.zero),
            },
            onLinkTap: (url) async {
              await UrlUtil().launchUrl(url);
            },
          ),
          user: user,
          timeAgo: timeAgo,
          includeLeadingIcon: false,
          onLongPress: () {
            var document = parse(content);
            var parsedString = parse(document.body.text).documentElement.text;

            Clipboard.setData(ClipboardData(text: parsedString)).then((_) {
              Fluttertoast.showToast(msg: 'Copied to clipboard');
            });
          },
        ),
      ),
    ];

    for (var comment in comments) {
      commentList.add(
        CommentTile(
          user: comment.user,
          content: comment.content,
          timeAgo: comment.timeAgo,
          comments: comment.comments,
          depth: depth + 1,
        ),
      );
    }

    return Column(
      children: commentList,
    );
  }

  Color _getBorderColor(int depth) {
    if (depth == -1) {
      return Colors.transparent;
    }

    switch (depth % 10) {
      case 9:
        return Colors.indigo;
      case 8:
        return Colors.white;
      case 7:
        return Colors.amber;
      case 6:
        return Colors.cyan;
      case 5:
        return Colors.red;
      case 4:
        return Colors.orange;
      case 3:
        return Colors.green;
      case 2:
        return Colors.purple;
      case 1:
        return Colors.blue;
      case 0:
      default:
        return Colors.brown;
    }
  }
}
