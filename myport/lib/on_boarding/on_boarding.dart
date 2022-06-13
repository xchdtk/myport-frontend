import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_register.dart';
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
  final contentPageController = Get.put(ContentPageViewController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
          width: width,
          child: Obx(() => Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      content_colors[contentPageController.current_page.value],
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ])),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width,
                        height: height * 0.66133004926,
                        child: PageView(
                          onPageChanged: ((value) =>
                              contentPageController.updatePage(value)),
                          controller: controller,
                          children: [
                            LoginRegisterContentWidget(
                              image_widget: Container(
                                padding: EdgeInsets.only(
                                    left: width * 0.16,
                                    right: width * 0.17066666666,
                                    top: height * 0.12068965517,
                                    bottom: height * 0.06157635467),
                                child: Image.asset(
                                    'asset/images/login_register_image_1.png',
                                    width: width * 0.66933333333,
                                    height: height * 0.30911330049),
                              ),
                              title: const [
                                "대학생들을 위한",
                                "맞춤형 네트워킹 플랫폼",
                              ],
                              description: const [
                                "나와 비슷한 학생들은 지금",
                                "어떤 활동을 하고 있는지 탐색해 보세요",
                              ],
                            ),
                            LoginRegisterContentWidget(
                              image_widget: Container(
                                padding: const EdgeInsets.only(
                                    left: 49, right: 40, top: 82, bottom: 35),
                                child: Image.asset(
                                    'asset/images/login_register_image_2.png',
                                    width: 286,
                                    height: 286),
                              ),
                              title: const [
                                "나만의 포트폴리오를 만들고",
                                "멋진 팀에 합류해 봐요",
                              ],
                              description: const [
                                "나만의 포트폴리오를 작성하고,",
                                "함께 할 팀에 어필해 보세요",
                              ],
                            ),
                            LoginRegisterContentWidget(
                              image_widget: SizedBox(
                                height: 403,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 168.98,
                                      left: 15,
                                      right: 181.68,
                                      bottom: 55.7,
                                      child: Container(
                                        width: 178.32,
                                        height: 178.32,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'asset/images/login_register_image_3.png'))),
                                      ),
                                    ),
                                    Positioned(
                                      top: 97,
                                      left: 145.87,
                                      right: 14,
                                      bottom: 90.88,
                                      child: Container(
                                        width: 215.13,
                                        height: 215.13,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'asset/images/login_register_image_4.png'))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title: const [
                                "대학생들을 위한",
                                "전문적인 네트워킹 플랫폼",
                              ],
                              description: const [
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
                          PagePickerWidget(
                              isActive:
                                  contentPageController.current_page.value ==
                                      0),
                          PagePickerWidget(
                              isActive:
                                  contentPageController.current_page.value ==
                                      1),
                          PagePickerWidget(
                              isActive:
                                  contentPageController.current_page.value == 2)
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
                              Get.toNamed('/register/common/four');
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              primary: const Color(0xff428EFF),
                              side: const BorderSide(
                                  color: Color(0xff428EFF), width: 0.7),
                            ),
                            child: const Text("회원가입"),
                          ))
                    ]),
              ))),
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
