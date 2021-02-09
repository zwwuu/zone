import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'web_view_body_controller.g.dart';

@Injectable()
class WebViewBodyController = _WebViewBodyControllerBase with _$WebViewBodyController;

abstract class _WebViewBodyControllerBase with Store {
  InAppWebViewController webViewController;

  @observable
  bool isLoadingWebContent = false;

  void reload() {
    webViewController?.reload();
  }
}
