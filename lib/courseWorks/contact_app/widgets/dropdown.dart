import 'package:aof_lessons/courseWorks/contact_app/utils/constant.dart';
import 'package:flutter/material.dart';

class ContactDropDown extends StatelessWidget {
  String? value;
  final void Function(String?)? onChanged;
  String hint;
  String? Function(String?) validator;
  ContactDropDown(
      {super.key,
      required this.onChanged,
      this.value,
      required this.hint,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        hint: Text(hint),
        items: SECURITY_QUESTIONS
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: onChanged);
  }
}
