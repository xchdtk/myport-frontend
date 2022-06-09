// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class LoginRegisterContentWidget extends StatelessWidget {
  final Widget image_widget;
  final List<String> title;
  final List<String> description;
  const LoginRegisterContentWidget(
      {required this.image_widget,
      required this.title,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Column(
          children: [
            image_widget,
            Text(
              title[0],
              style: TextStyle(
                  color: const Color(0xff428EFF),
                  fontSize: width * 0.056,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title[1],
              style: TextStyle(
                  color: const Color(0xff428EFF),
                  fontSize: width * 0.056,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: height * 0.01477832512,
        ),
        Column(
          children: [
            Text(
              description[0],
              style: TextStyle(
                fontSize: width * 0.03733333333,
              ),
            ),
            Text(
              description[1],
              style: TextStyle(
                fontSize: width * 0.03733333333,
              ),
            ),
            SizedBox(
              height: height * 0.0369458128,
            ),
          ],
        )
      ],
    );
  }
}
