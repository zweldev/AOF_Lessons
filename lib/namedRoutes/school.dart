import 'package:flutter/material.dart';

class SchoolPageEXP extends StatefulWidget {
  const SchoolPageEXP({super.key});

  @override
  State<SchoolPageEXP> createState() => _SchoolPageEXPState();
}

class _SchoolPageEXPState extends State<SchoolPageEXP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("School"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("office",
                    arguments: "School Argument");
              },
              child: Text("Go to Office")),
        ),
      ),
    );
  }
}
