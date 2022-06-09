// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:myport/controller/register.dart';
import 'package:myport/on_boarding/register/title_widget.dart';

import '../../controller/university.dart';

const page_number = 2;
const title = ["전공과 학번을 알려주시면", "맞춤 정보를 제공해요"];

class CommonProcess03 extends StatelessWidget {
  CommonProcess03({Key? key}) : super(key: key);

  final university_controller = Get.put(UniversityController());
  final register_major_controller =
      Get.put(RegisterInformationMajorController());
  final register_university_controller =
      Get.put(RegisterInformationUniversityController());
  final register_grade_controller =
      Get.put(ReigsterInformationGradeController());
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
              KeyboardActionsItem(
                  focusNode: register_major_controller.focusNode,
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
                  ]),
          ]);
    }

    void openBottomSheet() {
      Get.bottomSheet(
        Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Bottom Sheet',
                style: TextStyle(fontSize: 18),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
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
                () => register_major_controller.isSelect.value
                    ? Column(
                        children: [
                          TextFormField(
                              keyboardType: TextInputType.none,
                              focusNode: register_grade_controller.focusNode,
                              decoration: const InputDecoration(
                                hintText: "학번 입력",
                                hintStyle: TextStyle(
                                    fontSize: 21, color: Color(0xffEFF2FB)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffEFF2FB))),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff428EFF),
                                    width: 1.6,
                                  ),
                                ),
                              )),
                          TextFormField(
                              enabled: false,
                              controller: text_controller,
                              focusNode: register_major_controller.focusNode,
                              decoration: const InputDecoration(
                                hintText: "전공 입력",
                                hintStyle: TextStyle(
                                    fontSize: 21, color: Color(0xffEFF2FB)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffEFF2FB))),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff428EFF),
                                    width: 1.6,
                                  ),
                                ),
                              )),
                        ],
                      )
                    : TextFormField(
                        enabled: true,
                        onChanged: (value) {
                          university_controller.updateSearchMajor(value);
                        },
                        controller: text_controller,
                        focusNode: register_major_controller.focusNode,
                        decoration: const InputDecoration(
                          hintText: "전공 입력",
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
              SizedBox(
                  width: width,
                  height: 352,
                  child: Obx(
                    () => register_university_controller.isSelect.value
                        ? MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Obx(
                              () => register_major_controller.isSelect.value
                                  ? Container()
                                  : Scrollbar(
                                      child: ListView(
                                          children: university_controller
                                              .search_major_list
                                              .map((item) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                text_controller.text = item;
                                                register_major_controller
                                                    .selectMajor(item);
                                                register_major_controller
                                                    .changeIsSelect(true);
                                              },
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                          ],
                                        );
                                      }).toList()),
                                    ),
                            ))
                        : Container(),
                  )),
              const SizedBox(
                height: 88,
              ),
              Obx(
                () => SizedBox(
                  width: width * 0.872,
                  height: height * 0.06773399014,
                  child: ElevatedButton(
                    onPressed: register_major_controller.isSelect.value
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
