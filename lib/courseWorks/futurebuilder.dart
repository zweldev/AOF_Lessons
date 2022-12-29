import 'dart:math';

import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Random _random = Random();

Future<int> getRandom() async {
  await Future.delayed(Duration(seconds: _random.nextInt(5)));

  if (_random.nextBool()) {
    return _random.nextInt(100);
  }

  throw "ERROR";
}

class FutureBuilderEXP extends StatelessWidget {
  const FutureBuilderEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: 'FutureBuilderEXP',
        body: FutureBuilder(
          future: getRandom(),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Icon(Icons.error),
              );
            }
            return Container(
              child: Center(child: Text(snapshot.data.toString())),
            );
          },
        ));
  }
}
