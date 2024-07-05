import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas2_moa/controllers/auth/authentication_manager_controller.dart';
import 'package:tugas2_moa/shared/theme.dart';
import 'package:tugas2_moa/ui/pages/on_board_check.dart';



class SplashPage  extends StatelessWidget {
  final AuthenticationManagerController _authmanager = Get.put(AuthenticationManagerController());

  SplashPage ({super.key});
  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 1));
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError){
            return errorView(snapshot);
          }else{
            return const OnBoardCheck();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('MAKE YOUR OWN STORIES', style: blackTextStyle.copyWith(fontSize: 25, fontWeight: bold), textAlign: TextAlign.center,),
        ],
      ),
    ));
  }

  Scaffold container() {
    return Scaffold(
        body: Container(),
        );
  }
}
