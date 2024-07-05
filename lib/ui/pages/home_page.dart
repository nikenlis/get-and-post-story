
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/authentication_manager_controller.dart';
import 'package:tugas2_moa/controllers/home_controller.dart';
import 'package:tugas2_moa/routes/route_name.dart';
import 'package:tugas2_moa/ui/widgets/story_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthenticationManagerController _authManager = Get.find();
  final HomeController homeController =
         Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                _authManager.logOut();
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Obx(()=> GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: homeController.stories.length,
      itemBuilder: (ctx, i) {
        var story = homeController.stories[i];
        print(homeController.stories[1].id);
        return StoryItem(id: story.id! , imgUrl: story.photoUrl!, description: story.description!,);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
              ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(
                  context, RouteName.addNewStory);
      }, child: const Icon(Icons.add),),
    );
  }
}
