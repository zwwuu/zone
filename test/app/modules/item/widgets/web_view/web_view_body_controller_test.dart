import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zone/app/modules/item/item_module.dart';
import 'package:zone/app/modules/item/widgets/web_view/web_view_body_controller.dart';

void main() {
  initModule(ItemModule());
  WebViewBodyController webviewbody;
  //
  setUp(() {
    //     webviewbody = ItemModule.to.get<WebViewBodyController>();
  });

  group('WebViewBodyController Test', () {
    //   test("First Test", () {
    //     expect(webviewbody, isInstanceOf<WebViewBodyController>());
    //   });

    //   test("Set Value", () {
    //     expect(webviewbody.value, equals(0));
    //     webviewbody.increment();
    //     expect(webviewbody.value, equals(1));
    //   });
  });
}
