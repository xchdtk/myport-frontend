import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/splash_screen.dart';
import 'package:myport/user/login_register/login_register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xff428EFF),
          scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(name: '/login', page: () => const LoginRegisterPage())
      ],
    );
  }
}
