import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/authentication_manager_controller.dart';
import 'package:tugas2_moa/routes/route_name.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    AuthenticationManagerController authManager = Get.find();
    if (authManager.isLogged.value) {
      return RouteSettings(name: RouteName.home);
    } else {
      return RouteSettings(name: RouteName.login);
    }
  }
}


