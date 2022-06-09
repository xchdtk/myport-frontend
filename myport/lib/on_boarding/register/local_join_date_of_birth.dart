// ignore_for_file: non_constant_identifier_names, constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:myport/controller/register.dart';
import 'package:myport/on_boarding/register/local_join_id_password.dart';
import 'package:myport/on_boarding/register/title_widget.dart';

const page_number = "3 / 4";
const title = ["생년월일을", "입력해 주세요"];

class InputDateOfBirthScreen extends StatefulWidget {
  const InputDateOfBirthScreen({Key? key}) : super(key: key);

  @override
  State<InputDateOfBirthScreen> createState() => _InputDateOfBirthScreenState();
}

class _InputDateOfBirthScreenState extends State<InputDateOfBirthScreen> {
  final check_date_of_birth_controller =
      Get.put(RegisterInformationDateOfBirthController());

  final focus_node_list = [FocusNode(), FocusNode()];
  final textform_field_controller_list = [
    TextEditingController(),
    TextEditingController()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textform_field_controller_list[0].addListener(() {
      if (check_date_of_birth_controller.date_of_birth.value.length != 6 &&
          textform_field_controller_list[0].text.length == 6) {
        if (check_date_of_birth_controller.gender_number.value.length == 1) {
          check_date_of_birth_controller.updateCheckedDateOfBirth(true);
        }
        focus_node_list[1].requestFocus();
      } else {
        check_date_of_birth_controller.updateCheckedDateOfBirth(false);
      }
      check_date_of_birth_controller
          .updateDateOfBirth(textform_field_controller_list[0].text);
    });
    textform_field_controller_list[1].addListener(() {
      if (textform_field_controller_list[1].text.length == 1 &&
          check_date_of_birth_controller.date_of_birth.value.length == 6) {
        check_date_of_birth_controller
            .updateGenderNumber(textform_field_controller_list[1].text);
        check_date_of_birth_controller.updateCheckedDateOfBirth(true);
      } else if (textform_field_controller_list[1].text.isEmpty) {
        check_date_of_birth_controller.updateCheckedDateOfBirth(false);
      }
    });
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: const Color(0xffd0d4da),
        actions: [
          for (int number = 0; number < 2; number++)
            KeyboardActionsItem(
                focusNode: focus_node_list[number],
                toolbarButtons: [
                  (node) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () => node.unfocus(),
                        child: const Text(
                          "done",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }
                ])
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterInputTitleWidget(
                  page_number: page_number, title: title),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 145,
                    child: TextFormField(
                        focusNode: focus_node_list[0],
                        controller: textform_field_controller_list[0],
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          hintText: "생년월일",
                          hintStyle:
                              TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEFF2FB))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffEFF2FB)),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Color(0xffDDDDDD),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 145,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 33,
                          child: TextFormField(
                              focusNode: focus_node_list[1],
                              controller: textform_field_controller_list[1],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff428EFF),
                                          width: 2)))),
                        ),
                        for (num i = 0; i < 5; i++)
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xffDDDDDD),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 440,
              ),
              Obx(
                () => SizedBox(
                  width: width * 0.872,
                  height: height * 0.06773399014,
                  child: ElevatedButton(
                    onPressed: check_date_of_birth_controller
                            .checked_date_of_birth.value
                        ? () {
                            Get.to(InputIdPasswordScreen());
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        primary: const Color(0xff428EFF),
                        textStyle: TextStyle(fontSize: width * 0.045)),
                    child: const Text("다음으로"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
