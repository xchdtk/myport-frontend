// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/controller/register.dart';
import 'package:myport/user/login_register/register/phone_number_register.dart';
import 'package:myport/user/login_register/register/title_widget.dart';

const page_number = "1 / 4";
const title = ["이름을", "입력해주세요"];

class InputNameScreen extends StatefulWidget {
  const InputNameScreen({Key? key}) : super(key: key);

  @override
  State<InputNameScreen> createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  final check_name_controller = Get.put(RegisterInformationNameController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterInputTitleWidget(
                page_number: page_number,
                title: title,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    if (value.length < 10) {
                      check_name_controller.updateStateButton(false);
                      return;
                    }
                    check_name_controller.updateName(value);
                    check_name_controller.updateStateButton(true);
                    return;
                  },
                  validator: (value) {
                    if (value!.length < 10) {
                      return '10자이상 및 영문 및 특수문자 및 숫자를 포함시켜주세요.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "이름 입력",
                    hintStyle:
                        TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffEFF2FB))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffEFF2FB)),
                    ),
                  )),
              const SizedBox(
                height: 440,
              ),
              SizedBox(
                  width: width * 0.872,
                  height: height * 0.06773399014,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: check_name_controller.is_button_disabled.value
                          ? () {
                              Get.to(const InputPhoneNumberScreen());
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          primary: const Color(0xff428EFF),
                          textStyle: TextStyle(fontSize: width * 0.045)),
                      child: const Text("다음으로"),
                    ),
                  )),
            ],
          ),
        ));
  }
}
