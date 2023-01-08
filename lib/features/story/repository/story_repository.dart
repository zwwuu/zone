import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zone/core/config/app_constants.dart';
import 'package:zone/core/repository/item_repository.dart';
import 'package:zone/features/story/models/stories_type.dart';

class StoryRepository extends ItemRepository {
  Future<List<int>> getStories({required StoriesType storiesType}) async {
    http.Response response;
    switch (storiesType) {
      case StoriesType.topStories:
        response = await http
            .get(Uri.parse('${AppConstants.apiBaseUrl}/topstories.json'));
        break;
      case StoriesType.newStories:
        response = await http
            .get(Uri.parse('${AppConstants.apiBaseUrl}/newstories.json'));
        break;
      case StoriesType.bestStories:
        response = await http
            .get(Uri.parse('${AppConstants.apiBaseUrl}/beststories.json'));
        break;
      case StoriesType.askStories:
        response = await http
            .get(Uri.parse('${AppConstants.apiBaseUrl}/askstories.json'));
        break;
      case StoriesType.showStories:
        response = await http
            .get(Uri.parse('${AppConstants.apiBaseUrl}/showstories.json'));
        break;
      case StoriesType.jobsStories:
        response = await http
            .get(Uri.parse('${AppConstants.apiBaseUrl}/jobstories.json'));
        break;
      default:
        throw Exception('Failed to load newest stories');
    }

    if (response.statusCode == 200) {
      return List<int>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load newest stories');
    }
  }
}
