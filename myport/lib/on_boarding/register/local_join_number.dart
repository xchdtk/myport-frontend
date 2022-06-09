// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:myport/on_boarding/register/title_widget.dart';

import '../../../controller/register.dart';
import 'local_join_date_of_birth.dart';

const page_number = "2 / 4";
const title = ["인증번호를", "입력해 주세요"];

class InputPhoneNumberScreen extends StatefulWidget {
  const InputPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<InputPhoneNumberScreen> createState() => _InputPhoneNumberScreenState();
}

class _InputPhoneNumberScreenState extends State<InputPhoneNumberScreen> {
  final check_phone_number_controller =
      Get.put(RegisterInformationPhoneController());
  final remote_services_certifacation_number_controller =
      Get.put(RegisterCertificationNumberController());

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
      if (textform_field_controller_list[0].text.length == 11) {
        check_phone_number_controller.updateCheckedNumber(true);
        check_phone_number_controller
            .updatePhoneNumber(textform_field_controller_list[0].text);
      } else if (textform_field_controller_list[0].text.length != 11) {
        check_phone_number_controller.updateCheckedNumber(false);
        check_phone_number_controller.updatePhoneNumber("");
      }
    });
    textform_field_controller_list[1].addListener(() {
      // ignore: unrelated_type_equality_checks
      if (textform_field_controller_list[1].text ==
          remote_services_certifacation_number_controller
              .certification_number.value.number
              .toString()) {
        check_phone_number_controller.updateStateButton(true);
      } else {
        check_phone_number_controller.updateStateButton(false);
      }
    });
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: const Color(0xffd0d4da),
        actions: [
          for (int index = 0; index < 2; index++)
            KeyboardActionsItem(
                focusNode: focus_node_list[index],
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
                  page_number: page_number,
                  title: title,
                ),
                const SizedBox(
                  height: 36,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "+82",
                        style: TextStyle(fontSize: 21),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                            controller: textform_field_controller_list[0],
                            focusNode: focus_node_list[0],
                            enabled: check_phone_number_controller
                                    .checked_click_button.value
                                ? false
                                : true,
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 21, color: Color(0xffEFF2FB)),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            )),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 74,
                        height: 38,
                        child: OutlinedButton(
                          onPressed: check_phone_number_controller
                                  .checked_click_button.value
                              ? null
                              : check_phone_number_controller
                                      .checked_number.value
                                  ? () async {
                                      check_phone_number_controller
                                          .updateCheckedClickButton(true);
                                      await remote_services_certifacation_number_controller
                                          .fetchCertificationNumber(
                                              check_phone_number_controller
                                                  .phone_number.value);
                                    }
                                  : null,
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: const Color(0xff428EFF),
                            side: check_phone_number_controller
                                    .checked_click_button.value
                                ? const BorderSide(
                                    color: Colors.grey, width: 0.7)
                                : check_phone_number_controller
                                        .checked_number.value
                                    ? const BorderSide(
                                        color: Color(0xff428EFF), width: 0.7)
                                    : const BorderSide(
                                        color: Colors.grey, width: 0.7),
                            textStyle: TextStyle(
                              fontSize: width * 0.045,
                            ),
                          ),
                          child: const Text(
                            "인증번호",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  color: const Color(0xffEFF2FB),
                ),
                const SizedBox(
                  height: 24,
                ),
                Obx(() => TextFormField(
                    controller: textform_field_controller_list[1],
                    focusNode: focus_node_list[1],
                    enabled:
                        check_phone_number_controller.checked_click_button.value
                            ? true
                            : false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "인증번호 입력",
                        hintStyle:
                            TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffEFF2FB), width: 2)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffEFF2FB), width: 2),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffEFF2FB), width: 2),
                        )))),
                const SizedBox(
                  height: 362,
                ),
                Obx(
                  () => SizedBox(
                    width: width * 0.872,
                    height: height * 0.06773399014,
                    child: ElevatedButton(
                      onPressed:
                          check_phone_number_controller.is_button_disabled.value
                              ? () {
                                  Get.toNamed('register/birth');
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
        ));
  }
}
