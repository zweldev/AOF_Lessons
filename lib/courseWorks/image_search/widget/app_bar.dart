import 'dart:async';

import 'package:aof_lessons/courseWorks/image_search/model/searchModel.dart';
import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:aof_lessons/courseWorks/image_search/view/home.dart';
import 'package:flutter/material.dart';

class ImageSearchAppBarEXP extends StatefulWidget {
  Function search;
  StreamController<SearchModel> controller;
  TextEditingController textCon;
  FocusNode fNode;

  ImageSearchAppBarEXP({
    super.key,
    required this.controller,
    required this.search,
    required this.textCon,
    required this.fNode,
  });

  @override
  State<ImageSearchAppBarEXP> createState() => _ImageSearchAppBarEXPState();
}

class _ImageSearchAppBarEXPState extends State<ImageSearchAppBarEXP> {
  bool trySearch = false;

  @override
  Widget build(BuildContext context) {
    // print("Appbar is build $appBarBuildCount");
    // appBarBuildCount++;
    return Container(
      height: 80,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(color: Colors.red, boxShadow: [
        //important
        BoxShadow(
            offset: Offset(1, -1),
            blurRadius: 1,
            spreadRadius: 1,
            color: Color.fromRGBO(0, 0, 0, 0.5))
      ]),
      //appbar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (trySearch) ...[
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(

                    // isDense: true,
                    // filled: true,
                    // fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        widget.textCon.clear();
                        trySearch = !trySearch;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    hintText: "search ...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                focusNode: widget.fNode,
                controller: widget.textCon,
                onEditingComplete: () {
                  widget.search();
                  widget.controller.sink.add(SearchModel(dogResult.loading));
                  widget.textCon.clear();
                  widget.fNode.unfocus();
                },
                onChanged: (value) {
                  widget.controller.sink.add(SearchModel(dogResult.suggestion,
                      suggestion: API_service.instance()
                              .available
                              ?.dogs
                              .where((element) {
                            return element
                                .toLowerCase()
                                .replaceAll(" ", "")
                                .contains(
                                    value.toLowerCase().replaceAll(" ", ""));
                          }).toList() ??
                          ['LOL']));
                },
              ),
            ),
          ] else if (!trySearch) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Dogs",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
                color: Colors.white,
                splashRadius: 20,
                onPressed: () {
                  // print("Icon pressed $trySearch");
                  trySearch = !trySearch;
                  widget.fNode.requestFocus();
                  setState(() {});
                },
                icon: Icon(Icons.search))
          ]
        ],
      ),
    );
  }
}
