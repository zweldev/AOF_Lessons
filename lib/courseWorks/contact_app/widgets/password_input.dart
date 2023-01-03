import 'dart:ffi';

import 'package:aof_lessons/courseWorks/contact_app/utils/style.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  String hint;
  TextEditingController textControl;
  FocusNode fnode;
  String? Function(String?) validation;
  void Function()? onEditingFunc;

  PasswordInput({
    super.key,
    required this.hint,
    required this.textControl,
    required this.fnode,
    required this.validation,
    required this.onEditingFunc,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool showText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onEditingComplete: widget.onEditingFunc,
      validator: widget.validation,
      obscureText: showText,
      controller: widget.textControl,
      focusNode: widget.fnode,
      decoration: defaultInputDecoration.copyWith(
          hintText: widget.hint,
          suffixIcon: IconButton(
              splashRadius: 20,
              onPressed: () {
                showText = !showText;
                setState(() {});
              },
              icon: Icon(
                showText ? Icons.visibility : Icons.visibility_off,
                size: 18,
              ))),
    );
  }
}
