import 'package:flutter/material.dart';

class GeneratedUnKnownRouteEXP extends StatefulWidget {
  const GeneratedUnKnownRouteEXP({super.key});

  @override
  State<GeneratedUnKnownRouteEXP> createState() =>
      _GeneratedUnKnownRouteEXPState();
}

class _GeneratedUnKnownRouteEXPState extends State<GeneratedUnKnownRouteEXP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated Unknown Route"),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("home");
            },
            child: Text("Go Home, Your lost!")),
      ),
    );
  }
}
