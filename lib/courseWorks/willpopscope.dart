import 'dart:async';

import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:aof_lessons/courseWorks/wrap.dart';
import 'package:flutter/cupertino.dart';

class WillPopScopeEXP extends StatefulWidget {
  const WillPopScopeEXP({super.key});

  @override
  State<WillPopScopeEXP> createState() => _WillPopScopeEXPState();
}

enum reqExitStates { decline, request, access }

class _WillPopScopeEXPState extends State<WillPopScopeEXP> {
  bool con = false;
  reqExitStates reqOut = reqExitStates.decline;
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (e) {
      if (con) {
        Future.delayed(Duration(seconds: 1), () {
          reqOut = reqExitStates.decline;
          con = false;
        });
      }
    });
    return AppBarTemplateExp(
        title: 'WillPopScopeEXP',
        body: WillPopScope(
          onWillPop: () async {
            if (reqOut == reqExitStates.decline) {
              reqOut = reqExitStates.request;
              con = true;
              return false;
            }
            if (reqOut == reqExitStates.request) {
              reqOut = reqExitStates.access;
              con = false;
              return true;
            }
            return false;
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return DummyContainer(i: index);
            },
          ),
        ));
  }
}
