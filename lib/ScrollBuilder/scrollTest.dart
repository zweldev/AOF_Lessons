import 'package:flutter/material.dart';

class ScrollTestPageEXP extends StatefulWidget {
  const ScrollTestPageEXP({super.key});

  @override
  State<ScrollTestPageEXP> createState() => _ScrollTestPageEXPState();
}

class _ScrollTestPageEXPState extends State<ScrollTestPageEXP> {
  ScrollController scrollCon = ScrollController();
  @override
  Widget build(BuildContext context) {
    scrollCon.addListener(() {
      print(scrollCon.offset);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Scroll Test"),
        ),
        body: GridView.count(crossAxisCount: 3, ));
  }
}

class ContainerEXPLay extends StatelessWidget {
  final int i;
  const ContainerEXPLay({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    print("BuildNumber is $i");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text("$i"),
        ),
      ),
    );
  }
}
