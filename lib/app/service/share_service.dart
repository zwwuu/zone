import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';

import '../shared/util/extensions.dart';

part 'share_service.g.dart';

@Injectable()
class ShareService extends Disposable {
  void share({String title, String url}) {
    Share.share('$title\n${url.toUrl()}');
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
