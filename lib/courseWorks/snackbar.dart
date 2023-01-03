import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarEXP extends StatelessWidget {
  const SnackBarEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "SnackBarEXP",
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Press to submit"),
                      action: SnackBarAction(label: "Submit", onPressed: () {}),
                      // behavior: SnackBarBehavior.floating,
                      // margin: EdgeInsets.only(bottom: 10),
                      duration: Duration(seconds: 3),
                    ));
                  },
                  child: Text("Show Snack"))
            ],
          ),
        ));
  }
}
