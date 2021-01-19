import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/models/item.dart';

part 'item_repository.g.dart';

@Injectable()
class ItemRepository extends Disposable {
  final Dio _client;

  ItemRepository(this._client);

  Future<Item> fetchItem(int id) async {
    final response = await _client.get('/item/$id');

    if (response.statusCode == 200) {
      return Item.fromJson(response.data);
    } else {
      throw Exception(
        'Error Fetching Results: ${response.statusCode}',
      );
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
