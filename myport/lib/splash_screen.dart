import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/controller/university.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final university_controller = Get.put(UniversityController());
    university_controller.fetchUniversityInformation();
    Timer(const Duration(milliseconds: 5000), () {
      Get.toNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
