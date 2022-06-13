// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/on_boarding/register/common_process_01.dart';

import '../../../controller/register.dart';

const TextStyle title_text_style =
    TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

class CheckInformationScreen extends StatelessWidget {
  CheckInformationScreen({Key? key}) : super(key: key);

  final check_name_controller = Get.put(RegisterInformationNameController());
  final check_phone_number_controller =
      Get.put(RegisterInformationPhoneController());
  final check_date_of_birth_controller =
      Get.put(RegisterInformationDateOfBirthController());
  final profile_image_controller =
      Get.put(RegisterInformationProfileImageController());

  @override
  Widget build(BuildContext context) {
    final date_of_birth = check_date_of_birth_controller.date_of_birth.value;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget information_widget(value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03940886699,
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: height * 0.01477832512,
          ),
          Container(width: width, height: 1.6, color: const Color(0xffEFF2FB))
        ],
      );
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.only(top: height * 0.09852216748),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("아래 정보들을", style: title_text_style),
            const Text("확인해 주세요", style: title_text_style),
            SizedBox(
              height: height * 0.04926108374,
            ),
            SizedBox(
              width: 104,
              height: 104,
              child: Stack(
                children: [
                  Container(
                      width: 104,
                      height: 104,
                      decoration: BoxDecoration(
                          color: const Color(0xffDDDDDD),
                          borderRadius: BorderRadius.circular(50)),
                      child:
                          GetBuilder<RegisterInformationProfileImageController>(
                        builder: (_) => profile_image_controller.image != null
                            ? Image.file(
                                File(profile_image_controller.image!.path))
                            : const Icon(
                                Icons.people,
                                size: 50,
                                color: Color(0xffF9F9F9),
                              ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: (() async {
                        await profile_image_controller
                            .updateProfileFromGallery();
                      }),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.photo_size_select_actual_outlined,
                          size: 20,
                          color: Color(0xffAAAAAA),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            information_widget(check_name_controller.name),
            information_widget(
                check_phone_number_controller.phone_number.value),
            information_widget(
                "${date_of_birth[0]}${date_of_birth[1]}년 ${date_of_birth[2]}${date_of_birth[3]}월 ${date_of_birth[4]}${date_of_birth[5]}일"),
            // information_widget("김진수"),
            // information_widget("010 - 9765 - 0441"),
            // information_widget("99년 07월 08일"),
            Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                height: height * 0.2302955665,
              ),
            ),
            SizedBox(
              width: width * 0.872,
              height: height * 0.06773399014,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(CommonProcess_01());
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    primary: const Color(0xff428EFF),
                    textStyle: TextStyle(fontSize: width * 0.045)),
                child: const Text("다음으로"),
              ),
            ),
            SizedBox(
              height: height * 0.07881773399,
            )
          ],
        ),
      ),
    );
  }
}
