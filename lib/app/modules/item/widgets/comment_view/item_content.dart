import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../shared/util/url.dart';

class ItemContent extends StatelessWidget {
  final String content;

  const ItemContent({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: content,
        onLinkTap: (url) async {
          await UrlUtil().launchUrl(url);
        },
      ),
    );
  }
}
