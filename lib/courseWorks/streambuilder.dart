import 'dart:async';
import 'dart:math';

import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

StreamController _streamController = StreamController();
Random _random = Random();
void randomNum() {
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (_random.nextBool()) {
      _streamController.add(_random.nextInt(100));
    } else {
      _streamController.addError("Hello Error layy");
    }
  });
}

class StreamBuilderEXP extends StatefulWidget {
  const StreamBuilderEXP({super.key});

  @override
  State<StreamBuilderEXP> createState() => _StreamBuilderEXPState();
}

class _StreamBuilderEXPState extends State<StreamBuilderEXP> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomNum();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "StreamBuilder",
        body: StreamBuilder(
          initialData: 69,
          stream: _streamController.stream,
          builder: (context, snapshot) {
            print(snapshot);
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
            return Container(
              child: Center(child: Text(snapshot.data.toString())),
            );
          },
        ));
  }
}
