import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:flutter/material.dart';

class ImageSearchViewEXP extends StatefulWidget {
  const ImageSearchViewEXP({super.key});

  @override
  State<ImageSearchViewEXP> createState() => _ImageSearchViewEXPState();
}

enum dogResult { none, loading, fail, success }

class _ImageSearchViewEXPState extends State<ImageSearchViewEXP> {
  List<String> textToShow = [];
  TextEditingController textCon = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool trySearch = false;

  dogResult resultCondition = dogResult.none;

  void setData() {
    textCon.text = "Please enter a dog name";
    setState(() {});
  }

  void insertData(String dataEntry) {
    textCon.text = dataEntry;
    focusNode.unfocus();
    textToShow.clear();
    setState(() {});
  }

  void searchData() {
    // resultCondition = dogResult.loading;
    Future.delayed(Duration(seconds: 3), () {
      try {
        print("3 seconds kyr pee");
        API_service.instance().available?.dogs.firstWhere((element) {
          return element == textCon.text;
        });
        resultCondition = dogResult.success;
      } catch (e) {
        print("3 seconds failure");
        resultCondition = dogResult.fail;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // API_service.instance();
    // print(API_service.instance().available);

    return Scaffold(
      appBar: AppBar(
        title: trySearch
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "type your dog", border: InputBorder.none),
                    focusNode: focusNode,
                    controller: textCon,
                    onEditingComplete: () {
                      searchData();
                      resultCondition = dogResult.loading;
                      textToShow.clear();
                      focusNode.unfocus();
                      trySearch = !trySearch;
                      setState(() {});
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {});
                        // textToShow.clear();
                        return;
                      }

                      if (resultCondition != dogResult.none) {
                        resultCondition = dogResult.none;
                      }
                      List<String>? _resultData =
                          API_service.instance().available?.dogs;

                      if (_resultData != null) {
                        textToShow.addAll(_resultData
                            .where((element) => element.contains(value))
                            .toList());
                      }
                      setState(() {});
                    },
                  ),
                ),
              )
            : null,
        actions: [
          if (!trySearch) ...[
            IconButton(
                onPressed: () {
                  print("Icon pressed $trySearch");
                  trySearch = !trySearch;
                  focusNode.requestFocus();
                  setState(() {});
                },
                icon: Icon(Icons.search))
          ]
        ],
      ),
      body: Column(
        children: [
          if (resultCondition == dogResult.none) ...[
            if (textToShow.isNotEmpty)
              Expanded(
                child: ListView.builder(
                    itemCount: textToShow.length,
                    itemBuilder: (_, i) => InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            insertData(textToShow[i]);
                          },
                          child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [Text(textToShow[i])],
                              )),
                        )),
              ),
          ] else if (resultCondition == dogResult.loading) ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          ] else if (resultCondition == dogResult.success) ...[
            Center(
              child: Text("Success"),
            )
          ] else ...[
            Center(
              child: Text("Fail"),
            )
          ]
        ],
      ),
    );
  }
}

// Guide 20 [1:07:26]