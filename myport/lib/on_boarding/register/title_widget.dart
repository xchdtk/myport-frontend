// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:flutter/material.dart';

const TextStyle title_text_style =
    TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

class RegisterInputTitleWidget extends StatelessWidget {
  final String page_number;
  final List<String> title;
  const RegisterInputTitleWidget({
    required this.page_number,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 80, bottom: 12),
            width: 55,
            height: 27,
            decoration: BoxDecoration(
                color: const Color(0xffEFF2FB),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  page_number,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: Color(0xff428EFF), fontSize: 14),
                ),
              ],
            )),
        Text(title[0], style: title_text_style),
        Text(title[1], style: title_text_style),
      ],
    );
  }
}
