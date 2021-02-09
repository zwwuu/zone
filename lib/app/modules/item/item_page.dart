import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'item_controller.dart';
import 'widgets/item_body.dart';
import 'widgets/item_bottom_bar.dart';

class ItemPage extends StatefulWidget {
  final String id;

  const ItemPage({Key key, this.id}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemController> {
  @override
  void initState() {
    super.initState();
    controller.loadItem(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        var finishLoading = controller.itemFuture.status == FutureStatus.fulfilled;
        return Scaffold(
          appBar: AppBar(),
          body: ItemBody(),
          bottomNavigationBar: finishLoading ? ItemBottomBar() : null,
        );
      },
    );
  }
}
