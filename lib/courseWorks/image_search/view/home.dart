import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:flutter/material.dart';

class ImageSearchViewEXP extends StatefulWidget {
  const ImageSearchViewEXP({super.key});

  @override
  State<ImageSearchViewEXP> createState() => _ImageSearchViewEXPState();
}

class _ImageSearchViewEXPState extends State<ImageSearchViewEXP> {
  List<String> textToShow = [];
  @override
  Widget build(BuildContext context) {
    // print(API_service.instance().available);
    return Scaffold(
      appBar: AppBar(
        title: Text("Image EXP"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  List<String>? _data = API_service.instance().available?.dogs;

                  final List<String>? result = _data
                      ?.where((element) => element
                          .toLowerCase()
                          .replaceAll(" ", "")
                          .contains(value.toLowerCase().replaceAll(" ", "")))
                      .toList();
                  textToShow.clear();
                  setState(() {});
                  if (result?.isNotEmpty == true) {
                    textToShow.clear();
                    textToShow.addAll(result!);
                    setState(() {});
                  } else {
                    textToShow.clear();
                    setState(() {});
                  }
                },
              ),
              for (String x in textToShow) Text(x),
            ],
          ),
        ),
      ),
    );
  }
}
