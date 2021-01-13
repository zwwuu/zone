import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  UrlUtil();

  String _parseUrl(String url) {
    return Uri.parse(url).isAbsolute ? url : 'https://news.ycombinator.com/$url';
  }

  Future<void> launchUrl(String url) async {
    var parseUrl = _parseUrl(url);

    if (await canLaunch(parseUrl)) {
      await launch(parseUrl);
    } else {
      Fluttertoast.showToast(
        msg: 'Could not open $parseUrl',
      );
    }
  }

  void share({String title, String url}) {
    var parsedUrl = _parseUrl(url);
    Share.share('$title\n$parsedUrl');
  }
}
