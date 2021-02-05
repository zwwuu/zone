import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';

import '../shared/util/url_util.dart';

part 'share_service.g.dart';

@Injectable()
class ShareService extends Disposable {
  void share({String title, String url}) {
    var parsedUrl = UrlUtil.parseUrl(url);
    Share.share('$title\n$parsedUrl');
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
