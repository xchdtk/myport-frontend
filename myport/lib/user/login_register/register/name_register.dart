import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputNameScreen extends StatefulWidget {
  const InputNameScreen({Key? key}) : super(key: key);

  @override
  State<InputNameScreen> createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  FocusNode focusNode = FocusNode();
  late bool _isButtonDisabled;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isButtonDisabled = false;

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        focusNode.unfocus();
      }
    });
  }

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
            Container(
                margin: const EdgeInsets.only(top: 80, bottom: 12),
                width: 55,
                height: 27,
                decoration: BoxDecoration(
                    color: const Color(0xffEFF2FB),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "1 / 4",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff428EFF), fontSize: 14),
                    ),
                  ],
                )),
            const Text(
              "이름을",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "입력해주세요",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(
                focusNode: focusNode,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.length < 6) {
                    _isButtonDisabled = false;
                    return '10자이상 및 영문 및 특수문자 및 숫자를 포함시켜주세요.';
                  }
                  _isButtonDisabled = true;
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "이름 입력",
                  hintStyle: TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffEFF2FB))),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEFF2FB)),
                  ),
                )),
            const SizedBox(
              height: 440,
            ),
            SizedBox(
              width: width * 0.872,
              height: height * 0.06773399014,
              child: ElevatedButton(
                onPressed: _isButtonDisabled
                    ? () {
                        print("사랑해");
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
          ],
        ),
      ),
    );
  }
}
