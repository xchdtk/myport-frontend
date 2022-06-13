// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/controller/register.dart';
import 'package:myport/on_boarding/register/title_widget.dart';
import 'package:myport/textform_widget.dart';

const page_number = "1 / 4";
const title = ["이름을", "입력해 주세요"];
RegExp regExp = RegExp(r"^[ㄱ-ㅎ가-힣]*$");

class InputNameScreen extends StatefulWidget {
  const InputNameScreen({Key? key}) : super(key: key);

  @override
  State<InputNameScreen> createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  final check_name_controller = Get.put(RegisterInformationNameController());
  final textform_field_controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textform_field_controller.addListener(() {
      if (textform_field_controller.text.length < 2 ||
          textform_field_controller.text.length > 4 ||
          !regExp.hasMatch(textform_field_controller.text)) {
        check_name_controller.updateStateButton(false);
        return;
      }
      check_name_controller.updateName(textform_field_controller.text);
      check_name_controller.updateStateButton(true);
      return;
    });
  }

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
              TextFormWidget(
                text: "이름 입력",
                controller: textform_field_controller,
                enabled: true,
                validation: (value) {
                  if (value!.length < 2 || value.length > 4) {
                    return '2자리 이상 및 4자리 이하로 이름을 설정해주세요';
                  }
                  if (!regExp.hasMatch(value)) {
                    return '한글만 사용해주세요';
                  }
                  return null;
                },
              ),
              Flexible(
                fit: FlexFit.tight,
                child: SizedBox(
                  height: height * 1.84545454545,
                ),
              ),
              SizedBox(
                  width: width * 0.872,
                  height: height * 0.06773399014,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: check_name_controller.is_button_disabled.value
                          ? () {
                              Get.toNamed('register/phone');
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
              SizedBox(
                height: height * 0.07881773399,
              )
            ],
          ),
        ));
  }
}
