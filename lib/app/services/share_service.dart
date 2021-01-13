import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';

part 'share_service.g.dart';

@Injectable()
class ShareService extends Disposable {
  Future<void> share(String title, String url) {
    return Share.share('$title\n$url');
  }

  @override
  void dispose() {}
}
