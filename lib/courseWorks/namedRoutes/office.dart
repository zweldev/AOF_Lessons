import 'package:flutter/material.dart';

class OfficePageEXP extends StatefulWidget {
  const OfficePageEXP({super.key});

  @override
  State<OfficePageEXP> createState() => _OfficePageEXPState();
}

class _OfficePageEXPState extends State<OfficePageEXP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Office"),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("bar",  arguments: "Office Argument");
            },
            child: Text("Go to Bar")),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
