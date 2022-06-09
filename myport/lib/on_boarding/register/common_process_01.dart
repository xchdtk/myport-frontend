// ignore_for_file: constant_identifier_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/controller/register.dart';
import 'package:myport/on_boarding/register/common_process_02.dart';

const TextStyle title_text_style =
    TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle sub_title_text_style =
    TextStyle(color: Color(0xff636363), fontSize: 16);

class CommonProcess_01 extends StatelessWidget {
  CommonProcess_01({Key? key}) : super(key: key);

  final check_name_controller = Get.put(RegisterInformationNameController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.only(top: height * 0.09852216748),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: const Color(0xffDDDDDD),
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                Icons.people,
                size: 30,
                color: Color(0xffF9F9F9),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text("반가워요! ${check_name_controller.name}님",
                style: title_text_style),
            const Text("몇 가지 정보를 물어볼게요", style: title_text_style),
            const SizedBox(
              height: 16,
            ),
            const Text("마이포트를 더 알차게 사용하기 위해", style: sub_title_text_style),
            const Text("몇 가지 정보를 더 물어볼게요", style: sub_title_text_style),
            const SizedBox(
              height: 144,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('asset/images/login_register_image_6.png',
                  width: 285, height: 285),
            ]),
            SizedBox(
              width: width * 0.872,
              height: height * 0.06773399014,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(CommonProcess02());
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    primary: const Color(0xff428EFF),
                    textStyle: TextStyle(fontSize: width * 0.045)),
                child: const Text("다음으로"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
