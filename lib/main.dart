import 'package:flutter/material.dart';
import 'package:tugas2_moa/routes/route_name.dart';
import 'package:tugas2_moa/shared/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tugas2_moa/routes/app_page.dart';



void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      initialRoute: RouteName.splash,
      getPages: AppPages.pages,
    );
  }
  }

