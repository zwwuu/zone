extension ToRelativeTime on int {
  String toRelativeTime() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return '${difference.inDays ~/ 365} ${difference.inDays >= 1 ? 'years' : 'year'} ago';
    } else if (difference.inDays > 30) {
      return '${difference.inDays ~/ 30} ${difference.inDays >= 1 ? 'months' : 'month'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays >= 1 ? 'days' : 'day'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours >= 1 ? 'hours' : 'hour'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes >= 1 ? 'minutes' : 'minute'} ago';
    } else {
      return '${difference.inSeconds} ${difference.inSeconds >= 1 ? 'seconds' : 'second'} ago';
    }
  }
}
