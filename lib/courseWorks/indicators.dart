import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

class IndicatorsEXP extends StatefulWidget {
  const IndicatorsEXP({super.key});

  @override
  State<IndicatorsEXP> createState() => _IndicatorsEXPState();
}

class _IndicatorsEXPState extends State<IndicatorsEXP> {
  double i = 0;

  @override
  Widget build(BuildContext context) {
    if (i != 1) {
      Future.delayed(Duration(seconds: 1), () {
        i += 0.1;
        print("tickk $i");
        setState(() {});
      });
    }
    return AppBarTemplateExp(
        title: "Indicators",
        body: Center(
          child: CircularProgressIndicator(
            value: i,
          ),
        ));
  }
}
