import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/util/url_util.dart';

part 'url_launch_service.g.dart';

@Injectable()
class UrlLaunchService extends Disposable {
  Future<void> launchUrl(String url) async {
    var parseUrl = UrlUtil.parseUrl(url);
    await launch(parseUrl);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
