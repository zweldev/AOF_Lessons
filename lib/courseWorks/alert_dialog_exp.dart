import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

class AlertDialogEXP extends StatefulWidget {
  const AlertDialogEXP({super.key});

  @override
  State<AlertDialogEXP> createState() => _AlertDialogEXPState();
}

class _AlertDialogEXPState extends State<AlertDialogEXP> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "Alert Dialog",
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                a.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Choose Side"),
                          content: Text("Team black or Team Green"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  a++;
                                  Navigator.of(context).pop(a);
                                },
                                child: Text("Black")),
                            ElevatedButton(
                                onPressed: () {
                                  a--;
                                  Navigator.of(context).pop(a);
                                },
                                child: Text("Green")),
                          ],
                        );
                      },
                    ).then((value) {
                      print(value);
                      setState(() {
                        // a = value;
                      });
                      return;
                    });
                  },
                  child: Text("Click Me"))
            ],
          ),
        ));
  }
}
