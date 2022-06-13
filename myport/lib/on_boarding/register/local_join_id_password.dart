// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:myport/on_boarding/register/title_widget.dart';
import 'package:myport/textform_widget.dart';

const page_number = "4 / 4";
const title = ["아이디와 비밀번호를", "입력해 주세요"];

class InputIdPasswordScreen extends StatelessWidget {
  InputIdPasswordScreen({Key? key}) : super(key: key);

  final focus_node_list = [FocusNode(), FocusNode()];
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterInputTitleWidget(
                  page_number: page_number, title: title),
              const SizedBox(
                height: 32,
              ),
              TextFormWidget(
                enabled: true,
                focus_node: focus_node_list[0],
                validation: (value) {},
                text: "아이디",
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormWidget(
                enabled: true,
                focus_node: focus_node_list[1],
                validation: (value) {},
                text: "비밀번호",
              ),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: height * 0.45073891625,
                ),
              ),
              SizedBox(
                width: width * 0.872,
                height: height * 0.06773399014,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/register/check/information');
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
      ),
    );
  }
}
