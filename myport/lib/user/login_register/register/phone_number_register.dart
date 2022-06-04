// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/user/login_register/register/title_widget.dart';

import '../../../controller/register.dart';

const page_number = "2 / 4";
const title = ["인증번호를", "입력해주세요"];

class InputPhoneNumberScreen extends StatefulWidget {
  const InputPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<InputPhoneNumberScreen> createState() => _InputPhoneNumberScreenState();
}

class _InputPhoneNumberScreenState extends State<InputPhoneNumberScreen> {
  final check_number_controller = Get.put(RegisterInformationPhoneController());
  final remote_services_certifacation_number_controller =
      Get.put(RegisterCertificationNumberController());

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
                          enabled:
                              check_number_controller.checked_click_button.value
                                  ? false
                                  : true,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.length == 11) {
                              check_number_controller.updateCheckedNumber(true);
                              check_number_controller.updatePhoneNumber(value);
                            } else if (value.length != 11) {
                              check_number_controller
                                  .updateCheckedNumber(false);
                              check_number_controller.updatePhoneNumber("");
                            }
                            return;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        onPressed:
                            check_number_controller.checked_click_button.value
                                ? null
                                : check_number_controller.checked_number.value
                                    ? () async {
                                        check_number_controller
                                            .updateCheckedClickButton(true);
                                        await remote_services_certifacation_number_controller
                                            .fetchCertificationNumber(
                                                check_number_controller
                                                    .phone_number.value);
                                      }
                                    : null,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: const Color(0xff428EFF),
                          side: check_number_controller
                                  .checked_click_button.value
                              ? const BorderSide(color: Colors.grey, width: 0.7)
                              : check_number_controller.checked_number.value
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
                height: 30,
              ),
              Obx(() => TextFormField(
                  enabled: check_number_controller.checked_click_button.value
                      ? true
                      : false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    // ignore: unrelated_type_equality_checks
                    if (value ==
                        remote_services_certifacation_number_controller
                            .certification_number.value.number
                            .toString()) {
                      check_number_controller.updateStateButton(true);
                    } else {
                      check_number_controller.updateStateButton(false);
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "인증번호 입력",
                    hintStyle:
                        TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffEFF2FB))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffEFF2FB)),
                    ),
                  ))),
              const SizedBox(
                height: 362,
              ),
              Obx(
                () => SizedBox(
                  width: width * 0.872,
                  height: height * 0.06773399014,
                  child: ElevatedButton(
                    onPressed: check_number_controller.is_button_disabled.value
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
                ),
              )
            ],
          ),
        ));
  }
}
