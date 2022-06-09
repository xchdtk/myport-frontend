// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:myport/controller/register.dart';
import 'package:myport/controller/university.dart';
import 'package:myport/on_boarding/register/title_widget.dart';

const page_number = 1;
const title = ["어느 대학교를 다니셨나요?", "동문을 찾아드려요"];

class CommonProcess02 extends StatelessWidget {
  CommonProcess02({Key? key}) : super(key: key);

  final university_controller = Get.put(UniversityController());
  final register_university_controller =
      Get.put(RegisterInformationUniversityController());
  final register_major_controller =
      Get.put(RegisterInformationMajorController());
  final focus_node = FocusNode();
  final text_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
          keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
          keyboardBarColor: const Color(0xffd0d4da),
          actions: [
            for (int index = 0; index < 2; index++)
              KeyboardActionsItem(focusNode: focus_node, toolbarButtons: [
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
              ]),
          ]);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterInputTitleWidget(
                  page_number: "$page_number / 5", title: title),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => register_university_controller.isSelect.value
                    ? TextFormField(
                        enabled: false,
                        onChanged: ((value) {
                          university_controller.updateSerchUniversity(value);
                        }),
                        controller: text_controller,
                        focusNode: focus_node,
                        decoration: const InputDecoration(
                          hintText: "대학교 입력",
                          hintStyle:
                              TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEFF2FB))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff428EFF),
                              width: 1.6,
                            ),
                          ),
                        ))
                    : TextFormField(
                        enabled: true,
                        onChanged: ((value) {
                          university_controller.updateSerchUniversity(value);
                        }),
                        controller: text_controller,
                        focusNode: focus_node,
                        decoration: const InputDecoration(
                          hintText: "대학교 입력",
                          hintStyle:
                              TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEFF2FB))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff428EFF),
                              width: 1.6,
                            ),
                          ),
                        )),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: width,
                height: 352,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Obx(
                      () => register_university_controller.isSelect.value
                          ? Container()
                          : Scrollbar(
                              child: ListView(
                                  children: university_controller
                                      .search_university_list
                                      .map((item) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        text_controller.text =
                                            item.university_name;
                                        register_university_controller
                                            .selectUniversity(item);
                                        register_university_controller
                                            .changeIsSelect(true);
                                        university_controller.setMajor(
                                            register_university_controller
                                                .university.major_name);
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'asset/images/university.png',
                                              width: 30,
                                              height: 30),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            item.university_name,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                );
                              }).toList()),
                            ),
                    )),
              ),
              const SizedBox(
                height: 88,
              ),
              Obx(
                () => SizedBox(
                  width: width * 0.872,
                  height: height * 0.06773399014,
                  child: ElevatedButton(
                    onPressed: register_university_controller.isSelect.value
                        ? () {
                            Get.toNamed('/register/common/third');
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
