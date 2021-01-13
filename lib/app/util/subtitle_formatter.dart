import 'package:flutter/material.dart';

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

  static TextSpan buildUrlText(String domain) {
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
