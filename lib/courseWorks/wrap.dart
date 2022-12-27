import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

class WrapWidgetEXP extends StatelessWidget {
  const WrapWidgetEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "WrapWidgetEXP",
        body: Container(
          width: double.infinity,
          color: Colors.grey,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.end,
            runSpacing: 20,
            spacing: 10,
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.rtl,
            direction: Axis.vertical,
            children: [
              for (int x = 0; x < 10; x++)
                SizedBox(width: 100, height: 100, child: DummyContainer(i: x))
            ],
          ),
        ));
  }
}

class DummyContainer extends StatelessWidget {
  int i;
  DummyContainer({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.amber,
      child: Center(
        child: Text("$i"),
      ),
    );
  }
}
