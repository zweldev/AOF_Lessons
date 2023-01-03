import 'package:flutter/material.dart';

class UnknownPageEXP extends StatefulWidget {
  const UnknownPageEXP({super.key});

  @override
  State<UnknownPageEXP> createState() => _UnknownPageEXPState();
}

class _UnknownPageEXPState extends State<UnknownPageEXP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unknown Page"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("home", arguments: "Unknown Route");
              },
              child: Text("Go Home")),
        ),
      ),
    );
  }
}
