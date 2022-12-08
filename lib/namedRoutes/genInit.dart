import 'package:flutter/material.dart';

class OngenerateInitialPage extends StatefulWidget {
  const OngenerateInitialPage({super.key});

  @override
  State<OngenerateInitialPage> createState() => _OngenerateInitialPageState();
}

class _OngenerateInitialPageState extends State<OngenerateInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Initial Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Generate Initial Route"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("home");
                },
                child: Text("Go Home"))
          ],
        ),
      ),
    );
  }
}
