import 'package:aof_lessons/courseWorks/provider_lesson/provider/iProvider.dart';
import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHome extends StatelessWidget {
  ProviderHome({super.key});
  int buildTime = 0;

  @override
  Widget build(BuildContext context) {
    buildTime++;
    print("Buildtime is $buildTime");
    final I_provider provider = context.read<I_provider>();
    return AppBarTemplateExp(
        title: 'Provider Home',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<I_provider>(
              builder: (context, value, child) {
                return Text("${value.i}");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      provider.decrease();
                    },
                    child: Text("Decrease")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.increase();
                    },
                    child: Text("Increase"))
              ],
            )
          ],
        ));
  }
}
