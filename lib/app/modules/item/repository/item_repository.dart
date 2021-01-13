import 'package:flutter_modular/flutter_modular.dart';
import 'package:hnpwa_client/hnpwa_client.dart';

part 'item_repository.g.dart';

@Injectable()
class ItemRepository extends Disposable {
  final HnpwaClient _hnpwaClient;

  ItemRepository(this._hnpwaClient);

  Future<Item> fetchItem(int id) async {
    final item = await _hnpwaClient.item(id);
    return item;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
