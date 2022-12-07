import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("school", arguments: "School twrr mel");
            },
            child: Text("Go to School")),
      ),
    );
  }
}


// pushNamed, pushNamedandremoveuntil are futures 