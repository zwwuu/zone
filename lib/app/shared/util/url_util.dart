class UrlUtil {
  static String parseUrl(String url) {
    return Uri.parse(url).isAbsolute ? url : 'https://news.ycombinator.com/$url';
  }
}
