import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/models/story_model/get_all_stories_model.dart/get_all_stories_response_model.dart';
import 'package:tugas2_moa/models/story_model/get_detail_story_model.dart/get_detail_story_response.dart';
import 'package:tugas2_moa/sevices/story_services.dart';
import 'package:tugas2_moa/shared/theme.dart';


class MoreDetailStoryController extends GetxController {
  late final StoryServices _service;
  var selectedStory = Rx<Story3?>(null);

  @override
  void onInit() {
    super.onInit();
    _service = Get.put(StoryServices());
  }

  void getAllStories(String id) async {
    final response = await _service.fetchDetailStory(id);

    if (response != null) {
      print('INIII: ${response.story}');
      selectedStory.value = response.story!;
    } else {
     const Text('Ga ada data');
    }
  }
  
}

class MoreDetailStory extends StatelessWidget {
  String? id;
  MoreDetailStory({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
            final id = ModalRoute.of(context)?.settings.arguments as String;
    final MoreDetailStoryController moreDetailStoryController =
        Get.put(MoreDetailStoryController());
        moreDetailStoryController.getAllStories(id);
    final mediaQuery = MediaQuery.of(context);

    return Obx(()=>
    AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 480,
        width: mediaQuery.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                moreDetailStoryController.selectedStory.value!.photoUrl!,
                width: mediaQuery.size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              moreDetailStoryController.selectedStory.value!.description!,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
             const SizedBox(height: 16),
            Text(
              moreDetailStoryController.selectedStory.value!.createdAt!,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    )
    );
  }
}
