import 'package:flutter/material.dart';

class LoginRegisterContentWidget extends StatelessWidget {
  final List<String> title;
  final List<String> description;
  const LoginRegisterContentWidget(
      {required this.title, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              left: width * 0.16,
              right: width * 0.17066666666,
              top: height * 0.12068965517,
              bottom: height * 0.06157635467),
          child: Image.asset('asset/images/login_register_image_1.png',
              width: width * 0.66933333333, height: height * 0.30911330049),
        ),
        Column(
          children: [
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
