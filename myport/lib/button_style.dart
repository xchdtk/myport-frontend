// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  final text;
  const OutlineButtonWidget({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6),
        child: OutlinedButton(
          onPressed: () {},
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                text,
                style: const TextStyle(fontSize: 14),
              )),
          style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(color: Color(0xff9B9B9B))),
        ));
  }
}
