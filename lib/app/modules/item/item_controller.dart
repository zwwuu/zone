import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/item.dart';
import '../../shared/util/extensions.dart';
import 'repository/item_repository.dart';

part 'item_controller.g.dart';

@Injectable()
class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final ItemRepository _repository;

  int _id;
  InAppWebViewController webViewController;

  _ItemControllerBase(this._repository);

  @observable
  ObservableFuture<Item> itemFuture;

  @observable
  bool isViewingComment = false;

  @observable
  bool isLoadingWebContent = false;

  bool get hasWebContent => !itemFuture.value.domain.isNullOrEmpty();

  @action
  void switchView() {
    isViewingComment = !isViewingComment;
  }

  @action
  Future loadItem(String id) {
    _id = int.parse(id);
    return itemFuture = ObservableFuture(_repository.fetchItem(_id));
  }

  @action
  Future reloadItem() {
    return itemFuture = ObservableFuture(_repository.fetchItem(_id));
  }
}
