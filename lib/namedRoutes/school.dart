import 'package:flutter/material.dart';

class School extends StatefulWidget {
  const School({super.key});

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    String? name = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("School"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              // pushNames, pushReplacementNamed, pushnamedremoveuntil are futures
              final a = await Navigator.of(context).pushNamed("office");

              // a is the value of result
              print("done ${a}");
            },
            child: Text(

                // output value from arguments
                "${ModalRoute.of(context)?.settings.arguments.toString()}Go to Office")),
      ),
    );
  }
}
