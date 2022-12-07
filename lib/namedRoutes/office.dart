import 'package:flutter/material.dart';

class Office extends StatefulWidget {
  const Office({super.key});

  @override
  State<Office> createState() => _OfficeState();
}

class _OfficeState extends State<Office> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Office"),
        leading: IconButton(
            onPressed: () {

              // value added in result
              Navigator.of(context).pop("Well Done");
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("bar");
            },
            child: Text("Go to Bar")),
      ),
    );
  }
}
