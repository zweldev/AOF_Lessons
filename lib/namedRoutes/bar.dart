import 'package:flutter/material.dart';

class BarPageEXP extends StatelessWidget {
  final String title;
  const BarPageEXP({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bar"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("home", arguments: title);
              },
              child: Text(
                  // for Named Route
                  "${title}")),
        ),
      ),
    );
  }
}
