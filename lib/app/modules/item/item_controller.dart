import 'package:flutter_modular/flutter_modular.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';

import '../../services/share_service.dart';
import 'repository/item_repository.dart';

part 'item_controller.g.dart';

@Injectable()
class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final ItemRepository _repository;
  final ShareService _shareService;

  ObservableFuture<Item> itemFuture;

  @observable
  bool isViewingComment = false;

  _ItemControllerBase(this._repository, this._shareService);

  @action
  void switchView() {
    isViewingComment = !isViewingComment;
  }

  @action
  Future fetchItem(String id) {
    return itemFuture = ObservableFuture(_repository.fetchItem(int.parse(id)));
  }

  void share({String title, String url}) {
    _shareService.share(title, url);
  }
}
