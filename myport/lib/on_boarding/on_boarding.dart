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
                                "??????????????? ??????",
                                "????????? ???????????? ?????????",
                              ],
                              description: const [
                                "?????? ????????? ???????????? ??????",
                                "?????? ????????? ?????? ????????? ????????? ?????????",
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
                                "????????? ?????????????????? ?????????",
                                "?????? ?????? ????????? ??????",
                              ],
                              description: const [
                                "????????? ?????????????????? ????????????,",
                                "?????? ??? ?????? ????????? ?????????",
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
                                "??????????????? ??????",
                                "???????????? ???????????? ?????????",
                              ],
                              description: const [
                                "??????????????? ?????? ????????????,",
                                "??? ?????? ???????????? ???????????????.",
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
                          child: const Text("?????????"),
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
                            child: const Text("????????????"),
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
