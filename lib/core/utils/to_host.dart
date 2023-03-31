extension ToHost on String {
  String toHost() {
    try {
      final uri = Uri.parse(this);
      final host = uri.host;
      return host;
    } catch (_) {
      return '';
    }
  }
}
