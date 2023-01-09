import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:aof_lessons/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHomeExp extends StatelessWidget {
  const ProviderHomeExp({super.key});

  @override
  Widget build(BuildContext context) {
    final RamDon result = context.read<RamDon>();
    return AppBarTemplateExp(
        title: "Provider Home EXP",
        body: Center(
          child: Text("${result.name}"),
        ));
  }
}


// provider -> doesn't change value, only show value
// provider.value -> show value anf change value as well