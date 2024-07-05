import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/models/story_model/get_all_stories_model.dart/get_all_stories_response_model.dart';
import 'package:tugas2_moa/sevices/story_services.dart';
import 'package:tugas2_moa/utils/api_endpoints.dart';

class HomeController extends GetxController {
  late final StoryServices _service;
  var stories = List<Story2>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    _service = Get.put(StoryServices());
    getAllStories();
  }

  void getAllStories() async {
    final response = await _service.fetchAllStories();

    if (response != null) {
      print('Ini adalah hasil response all: ${response.listStory}');
      stories.clear();
      for (var storyData in response.listStory!) {
        Story2 story = Story2(
          id: storyData.id,
          name: storyData.name,
          description: storyData.description,
          photoUrl: storyData.photoUrl,
          createdAt: storyData.createdAt,
        );
        stories.add(story);
      }

      print('Hasil : ${stories[1]}');
    } else {
      const Text('Ga ada data');
    }
  }
}
