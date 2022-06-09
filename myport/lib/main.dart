import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/on_boarding/on_boarding.dart';
import 'package:myport/on_boarding/register/common_process_01.dart';
import 'package:myport/on_boarding/register/common_process_02.dart';
import 'package:myport/splash_screen.dart';

import 'on_boarding/register/check_information_register.dart';
import 'on_boarding/register/common_process_03.dart';
import 'on_boarding/register/local_join_date_of_birth.dart';
import 'on_boarding/register/local_join_id_password.dart';
import 'on_boarding/register/local_join_name.dart';
import 'on_boarding/register/local_join_number.dart';

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
        GetPage(name: '/login', page: () => const LoginRegisterPage()),
        GetPage(name: '/register/name', page: () => const InputNameScreen()),
        GetPage(
            name: '/register/phone',
            page: () => const InputPhoneNumberScreen()),
        GetPage(
            name: '/register/birth',
            page: () => const InputDateOfBirthScreen()),
        GetPage(
            name: '/register/user_id/password',
            page: () => InputIdPasswordScreen()),
        GetPage(
            name: '/register/check/information',
            page: () => CheckInformationScreen()),
        GetPage(name: '/register/common/first', page: () => CommonProcess_01()),
        GetPage(name: '/register/common/two', page: () => CommonProcess02()),
        GetPage(name: '/register/common/third', page: () => CommonProcess03()),
      ],
    );
  }
}
