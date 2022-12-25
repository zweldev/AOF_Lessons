import 'package:flutter/material.dart';

class HomePageEXP extends StatefulWidget {
  const HomePageEXP({super.key});

  @override
  State<HomePageEXP> createState() => _HomePageEXPState();
}

class _HomePageEXPState extends State<HomePageEXP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("school", arguments: "Home Argument");
              },
              child: Text("Go to School")),
        ),
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
