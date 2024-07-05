

import 'package:get/get.dart';
import 'package:tugas2_moa/storage/cache_manager.dart';

class AuthenticationManagerController extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    print(token);
    if (token != null) {
      isLogged.value = true;
    }
  }
}
