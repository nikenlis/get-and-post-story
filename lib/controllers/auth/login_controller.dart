import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/authentication_manager_controller.dart';
import 'package:tugas2_moa/models/auth_model/login_request_model.dart';
import 'package:tugas2_moa/sevices/auth_service.dart';


class LoginController extends GetxController {
  late final AuthService _service;
  late final AuthenticationManagerController _authManager;

  @override
  void onInit() {
    super.onInit();
    _service = Get.put(AuthService());
    _authManager = Get.put(AuthenticationManagerController());
  }

  Future<void> loginUser(String email, String password) async {
    LoginRequestModel requestModel = LoginRequestModel(
        email: email,
        password: password
      );

    final response = await _service
        .fetchLogin(requestModel);

    if (response != null) {
      print('Login successful, token: ${response.loginResult!.token}');
      _authManager.login(response.loginResult!.token);
    } else {
      Get.defaultDialog(
          middleText: 'Not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }


}
