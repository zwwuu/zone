import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/bookmark_repository.dart';
import 'bookmark_controller.dart';
import 'bookmark_page.dart';

class BookmarkModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BookmarkRepository,
        $BookmarkController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => BookmarkPage(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<BookmarkModule>.of();
}
