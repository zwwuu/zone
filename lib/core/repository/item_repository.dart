import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zone/core/config/app_constants.dart';
import 'package:zone/core/models/item.dart';

class ItemRepository {
  Future<Item> getItem({required int id}) async {
    final response =
        await http.get(Uri.parse('${AppConstants.apiBaseUrl}/item/$id.json'));

    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load item');
    }
  }
}
