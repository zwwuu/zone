import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubtitleFormatter {
  static TextSpan buildUserText(String user) {
    if (user == null) {
      return TextSpan(
        text: '',
      );
    } else {
      return TextSpan(
        children: [
          TextSpan(
            text: '$user',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          TextSpan(
            text: ' · ',
          )
        ],
      );
    }
  }

  static TextSpan buildDomainText(String domain) {
    if (domain == null) {
      return TextSpan(
        text: '',
      );
    } else {
      return TextSpan(
        children: [
          TextSpan(
            text: '$domain',
            style: TextStyle(
              color: Colors.lightBlue,
            ),
          ),
          TextSpan(
            text: ' · ',
          )
        ],
      );
    }
  }

  static TextSpan buildCommentCountText(int commentCount) {
    if (commentCount == null) {
      return TextSpan(
        text: '',
      );
    } else {
      return TextSpan(
        children: [
          TextSpan(
            text: commentCount <= 1 ? '$commentCount comment ' : '$commentCount comments ',
            style: TextStyle(
              color: Colors.lightGreen,
            ),
          ),
          TextSpan(
            text: ' · ',
          ),
        ],
      );
    }
  }

  static TextSpan buildTimeAgoText(String timeAgo) {
    if (timeAgo == null) {
      return TextSpan(
        text: '',
      );
    } else {
      return TextSpan(
        text: '$timeAgo',
      );
    }
  }

  static TextSpan buildTimeText(int time) {
    if (time == null) {
      return TextSpan(
        text: '',
      );
    } else {
      var date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      var dateString = DateFormat.yMMMMd().add_jm().format(date);
      return TextSpan(
        text: '$dateString',
      );
    }
  }
}
