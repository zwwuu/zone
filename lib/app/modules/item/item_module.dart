import 'package:flutter_modular/flutter_modular.dart';
import 'package:zone/app/modules/item/widgets/web_view/web_view_body_controller.dart';

import 'item_controller.dart';
import 'item_page.dart';
import 'repository/item_repository.dart';

class ItemModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $WebViewBodyController,
        $ItemController,
        $ItemRepository,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/:id', child: (_, args) => ItemPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<ItemModule>.of();
}
