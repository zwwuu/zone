import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/bookmarks/bookmark_module.dart';
import 'modules/home/home_module.dart';
import 'modules/item/item_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio(BaseOptions(baseUrl: 'http://api.hackerwebapp.com'))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: HomeModule(),
        ),
        ModularRouter(
          '/item',
          module: ItemModule(),
        ),
        ModularRouter(
          '/bookmarks',
          module: BookmarkModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
