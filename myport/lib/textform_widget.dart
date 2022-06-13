// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final keyboard_type;
  final text;
  final focus_node;
  final controller;
  final disable_border;
  final focus_border;
  final enabled;
  final validation;
  final on_change;
  const TextFormWidget(
      {required this.enabled,
      this.keyboard_type,
      this.text,
      this.focus_node,
      this.validation,
      this.disable_border,
      this.controller,
      this.on_change,
      this.focus_border,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled,
        controller: controller,
        onChanged: on_change,
        focusNode: focus_node,
        validator: validation,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(fontSize: 21),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(fontSize: 21, color: Color(0xffEFF2FB)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEFF2FB))),
          focusedBorder: focus_border ??
              const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff428EFF),
                  width: 1.6,
                ),
              ),
          disabledBorder: disable_border ?? InputBorder.none,
        ));
  }
}
