// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unused_element, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/on_boarding/register/title_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../../controller/register.dart';

const TextStyle title_text_style =
    TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
const page_number = 3;
const interest_list = [
  "기획아이디어",
  "광고/마케팅",
  "디자인",
  "영상/콘텐츠",
  "IT/SW",
  "문학시나리오",
  "창업/스타트업",
  "금융/경제/투자",
  "봉사활동",
  "뷰티/패션",
  "헬스/스포츠",
  "해외탐방/유학",
  "기타"
];

class CommonProcess04 extends StatefulWidget {
  const CommonProcess04({Key? key}) : super(key: key);

  @override
  State<CommonProcess04> createState() => _CommonProcess04State();
}

class _CommonProcess04State extends State<CommonProcess04> {
  final check_name_controller = Get.put(RegisterInformationNameController());
  final check_interest_controller =
      Get.put(ReigsterInformationInterestController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget toggle_button(item, is_select, index) {
      return GestureDetector(
        onTap: () {
          check_interest_controller.changeInterest(
              index, !check_interest_controller.is_select.value[index]);
        },
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(
                  color: is_select
                      ? const Color(0xff428EFF)
                      : const Color(0xffE5E5E5),
                  width: 2)),
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04266666666,
                  vertical: height * 0.0184729064),
              child: Text(
                item,
                style: TextStyle(
                    fontSize: 14,
                    color: is_select
                        ? const Color(0xff428EFF)
                        : const Color(0xff9B9B9B),
                    fontWeight: FontWeight.bold),
              )),
        ),
      );
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterInputTitleWidget(
              page_number: "$page_number / 4",
              title: ["${check_name_controller.name}님이 관심있는 분야를", "3가지만 알려주세요"],
            ),
            SizedBox(
              height: height * 0.06896551724,
            ),
            Wrap(
              children: interest_list
                  .mapIndexed(
                    (index, item) => Obx(() => toggle_button(
                        item,
                        check_interest_controller.is_select.value[index],
                        index)),
                  )
                  .toList(),
            ),
            Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: height * 0.18842364532,
                )),
            SizedBox(
              width: width * 0.872,
              height: height * 0.06773399014,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    primary: const Color(0xff428EFF),
                    textStyle: TextStyle(fontSize: width * 0.045)),
                child: const Text("다음으로"),
              ),
            ),
            SizedBox(
              height: height * 0.09852216748,
            )
          ],
        ),
      ),
    );
  }
}
