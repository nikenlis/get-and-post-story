import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/authentication_manager_controller.dart';
import 'package:tugas2_moa/models/auth_model/register_request_model.dart';
import 'package:tugas2_moa/sevices/auth_service.dart';
import 'package:tugas2_moa/shared/share_method.dart';
import 'package:tugas2_moa/shared/theme.dart';

class RegisterController extends GetxController {
  late final AuthService _service;

  @override
  void onInit() {
    super.onInit();
    _service = Get.put(AuthService());
  }

  Future<void> registerUser(String name, String email, String password) async {
    RegisterRequestModel requestModel = RegisterRequestModel(
      name: name,
      email: email,
      password: password,
    );

    final response = await _service.fetchRegister(requestModel);

    if (response != null) {
      Get.defaultDialog(
          middleText: 'Register successful/n ${response.message!}',
          textConfirm: 'OK',
          confirmTextColor: whiteColor,
          onConfirm: () {
            Get.back();
          });
    } else {
      Get.defaultDialog(
          middleText: 'Email is already taken',
          textConfirm: 'OK',
          confirmTextColor: whiteColor,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
