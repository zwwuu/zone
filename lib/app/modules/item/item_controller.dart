import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/item.dart';
import 'repository/item_repository.dart';

part 'item_controller.g.dart';

@Injectable()
class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final ItemRepository _repository;

  ObservableFuture<Item> itemFuture;

  @observable
  bool isViewingComment = false;

  _ItemControllerBase(this._repository);

  @action
  void switchView() {
    isViewingComment = !isViewingComment;
  }

  @action
  Future loadItem(String id) {
    return itemFuture = ObservableFuture(_repository.fetchItem(int.parse(id)));
  }
}
