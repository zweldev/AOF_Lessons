
import 'package:aof_lessons/courseWorks/templates/appbar_template.dart';
import 'package:flutter/material.dart';

class Bottom_SheetEXP extends StatelessWidget {
  const Bottom_SheetEXP({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarTemplateExp(
        title: "BottomSheetEXP",
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pop("BottomSheet_Back $index");
                                },
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text("Item $index"),
                                ),
                              );
                            },
                          ),
                          decoration: BoxDecoration(
                              color: Colors.amber[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        );
                      },
                    ).then((value) => print(value));
                  },
                  child: Text("Show Bottom"))
            ],
          ),
        ));
  }
}
