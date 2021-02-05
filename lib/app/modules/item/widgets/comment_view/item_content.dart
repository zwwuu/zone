import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../service/url_launch_service.dart';

class ItemContent extends StatelessWidget {
  final UrlLaunchService urlLaunchService = Modular.get();

  final String content;

  ItemContent({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: content,
        onLinkTap: (url) {
          urlLaunchService.launchUrl(url);
        },
      ),
    );
  }
}
