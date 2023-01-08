import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HtmlContent extends StatelessWidget {
  const HtmlContent({super.key, required this.html, this.textStyle});

  final String html;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      textStyle: textStyle,
      onTapUrl: (url) async {
        if (await canLaunchUrlString(url)) {
          return await launchUrlString(url);
        }
        return false;
      },
      customWidgetBuilder: (element) {
        if (element.localName == 'pre') {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(4),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(4),
              scrollDirection: Axis.horizontal,
              child: Text(element.text),
            ),
          );
        }

        return null;
      },
    );
  }
}
