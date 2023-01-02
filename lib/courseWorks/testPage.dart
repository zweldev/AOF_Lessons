import 'dart:math';

import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

Random _random = Random();

Future<int> func() async {
  await Future.delayed(Duration(seconds: _random.nextInt(5)));

  if (_random.nextBool()) {
    return _random.nextInt(100);
  }
  throw 'ERROR';
}

class TestHereEXP extends StatelessWidget {
  const TestHereEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "Test Page EXP",
        body: FutureBuilder(
          future: func(),
          builder: (context, snapshot) {
            print("Snapshot iss $snapshot");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Icon(Icons.error),
              );
            }

            return Center(
              child: Text(snapshot.data.toString()),
            );
          },
        ));
  }
}
