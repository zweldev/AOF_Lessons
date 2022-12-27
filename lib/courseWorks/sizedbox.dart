import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

class SizedBoxEXP extends StatelessWidget {
  const SizedBoxEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "SizedBoxEXP",
        body: Container(
          color: Colors.white,
          child: Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Click ME"),
              ),
            ),
          ),
        ));
  }
}
