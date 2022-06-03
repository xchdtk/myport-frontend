import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myport/user/login_register/register/name_register.dart';
import 'content.dart';

// ignore: non_constant_identifier_names
final List content_colors = [
  const Color(0xffA9CBFF),
  const Color(0xffE3AC80),
  const Color(0xffA9CBFF),
];

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  // ignore: non_constant_identifier_names
  int current_page = 0;
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                content_colors[current_page],
                Colors.white,
                Colors.white,
                Colors.white,
              ])),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              width: width,
              height: height * 0.66133004926,
              child: PageView(
                onPageChanged: ((value) => setState(() {
                      current_page = value;
                    })),
                controller: controller,
                children: const [
                  LoginRegisterContentWidget(
                    title: [
                      "대학생들을 위한",
                      "맞춤형 네트워킹 플랫폼",
                    ],
                    description: [
                      "나와 비슷한 학생들은 지금",
                      "어떤 활동을 하고 있는지 탐색해 보세요",
                    ],
                  ),
                  LoginRegisterContentWidget(
                    title: [
                      "나만의 포트폴리오를 만들고",
                      "멋진 팀에 합류해 봐요",
                    ],
                    description: [
                      "나만의 포트폴리오를 작성하고,",
                      "함께 할 팀에 어필해 보세요",
                    ],
                  ),
                  LoginRegisterContentWidget(
                    title: [
                      "대학생들을 위한",
                      "전문적인 네트워킹 플랫폼",
                    ],
                    description: [
                      "지포트에서 나를 준비하고,",
                      "더 넓은 세상으로 출발하세요.",
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PagePickerWidget(isActive: current_page == 0),
                PagePickerWidget(isActive: current_page == 1),
                PagePickerWidget(isActive: current_page == 2)
              ],
            ),
            SizedBox(
              height: height * 0.09359605911,
            ),
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
                child: const Text("로그인"),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            SizedBox(
                width: width * 0.872,
                height: height * 0.06773399014,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(const InputNameScreen());
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    primary: const Color(0xff428EFF),
                    side:
                        const BorderSide(color: Color(0xff428EFF), width: 0.7),
                  ),
                  child: const Text("회원가입"),
                ))
          ]),
        ),
      ),
    );
  }
}

class PagePickerWidget extends StatelessWidget {
  final bool isActive;

  const PagePickerWidget({required this.isActive, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isActive
            ? Container(
                width: 18.0,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff428EFF),
                ),
              )
            : Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffEFF2FB),
                ),
              ),
        const SizedBox(
          width: 8.0,
        ),
      ],
    );
  }
}
