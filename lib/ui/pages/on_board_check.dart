import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/authentication_manager_controller.dart';
import 'package:tugas2_moa/controllers/home_controller.dart';
import 'package:tugas2_moa/ui/pages/home_page.dart';
import 'package:tugas2_moa/ui/pages/login_page.dart';



class OnBoardCheck extends StatelessWidget {
  const OnBoardCheck({super.key});

  @override
  Widget build(BuildContext context) {
    
    AuthenticationManagerController _authManager = Get.find();
    return Obx(() {
       print('BISAAA NGGGA NIHHHHHHH: ${_authManager.isLogged.value}');
       if(_authManager.isLogged.value) {
         Get.put(HomeController());
        return const HomePage();
       } else {
        return LoginPage();
       }
      // return _authManager.isLogged.value ? const HomePage() : LoginPage();
    });
  }
}
