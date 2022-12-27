import 'package:flutter/material.dart';

class AppBarTemplateExp extends StatelessWidget {
  String title;
  Widget body;
  AppBarTemplateExp({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(title),
      ),
      body: body,
    );
  }
}
