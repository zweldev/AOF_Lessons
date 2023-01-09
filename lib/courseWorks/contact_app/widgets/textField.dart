import 'package:flutter/material.dart';

class ContactAppInput extends StatelessWidget {
  String hintText;
  FocusNode? focusNode;
  late TextEditingController controller;
  void Function()? oneditingComplete;
  String? Function(String?) validator;
  ContactAppInput(
      {super.key,
      required this.validator,
      this.oneditingComplete,
      this.focusNode,
      required this.controller,
      required this.hintText,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      focusNode: focusNode,
      onEditingComplete: oneditingComplete,
      controller: controller,
      decoration:
          InputDecoration(hintText: hintText, border: OutlineInputBorder()),
    );
  }
}
