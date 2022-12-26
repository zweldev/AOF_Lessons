import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:starlight_type_ahead/starlight_type_ahead.dart';

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
              StarlightTypeAhead(
                  controller: TextEditingController(),
                  data: API_service.instance().available?.dogs,
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  itemHeight: 50,
                  itemBuilder: (e) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("$e"),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
