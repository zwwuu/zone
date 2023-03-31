extension ToCompact on int {
  String toCompact() {
    if (this < 1000) {
      return toString();
    }

    if (this < 1000000) {
      return '${(this / 1000).toStringAsFixed(1)}k';
    }

    if (this < 1000000000) {
      return '${(this / 1000000).toStringAsFixed(1)}m';
    }

    if (this < 1000000000000) {
      return '${(this / 1000000000).toStringAsFixed(1)}b';
    }

    return '${(this / 1000000000000).toStringAsFixed(1)}t';
  }
}
