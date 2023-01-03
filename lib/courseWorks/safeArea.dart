import 'package:flutter/material.dart';

class SafeAreaEXP extends StatelessWidget {
  const SafeAreaEXP({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text("SafeArea"),
      // ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [TextField()],
          ),
        ),
      ),
    );
  }
}
