import 'package:get/get.dart';
import 'package:tugas2_moa/ui/pages/add_new_story_page.dart';
import 'package:tugas2_moa/ui/pages/home_page.dart';
import 'package:tugas2_moa/ui/pages/login_page.dart';
import 'package:tugas2_moa/ui/pages/more_detail_story.dart';
import 'package:tugas2_moa/ui/pages/register_page.dart';
import 'package:tugas2_moa/ui/pages/splash_page.dart';
import 'route_name.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.splash,
      page: () => SplashPage()
    ),
     GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteName.addNewStory,
      page: () => AddNewStoryPage(),
    ),
    //     GetPage(
    //   name: RouteName.addNewStory,
    //   page: () => MoreDetailStory(),
     
    // ),
  ];
}
