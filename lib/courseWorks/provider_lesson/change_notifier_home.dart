import 'package:aof_lessons/courseWorks/provider_lesson/provider/change_notifier_provider.dart';
import 'package:aof_lessons/courseWorks/provider_lesson/provider/iProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierHome extends StatelessWidget {
  const ChangeNotifierHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Notifier Home"),
      ),
      body: Consumer2<ChangeNotiProviderEXP, I_provider>(
        builder: (context, value, value2, child) {
          return ListView.builder(
              itemCount: value.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${value.items[index]}"),
                  subtitle: Text("${value2.i.toString()}"),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ChangeNotiProviderEXP>().refresh();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
