import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:flutter/material.dart';

class ImageSearchViewEXP extends StatefulWidget {
  const ImageSearchViewEXP({super.key});

  @override
  State<ImageSearchViewEXP> createState() => _ImageSearchViewEXPState();
}

enum dogResult { none, loading, fail, success }

class _ImageSearchViewEXPState extends State<ImageSearchViewEXP> {
  late API_service api;
  @override
  void initState() {
    /// code here if you want to program before state initialized

    api = API_service.instance();
    super.initState();
    //// code here if you want to program after state initialized
  }

  @override
  void dispose() {
    //// code heree to program before state disposal
    super.dispose();
  }

  List<String> textToShow = [];
  TextEditingController textCon = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool trySearch = false;

  dogResult resultCondition = dogResult.none;

  List<ImageModel> dogImages = [];

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

  Future<void> searchData() async {
    dogImages.clear();

    List<Future<ImageModel?>> _toDo =
        List.generate(10, (index) => api.getDog(textCon.text));

    List<ImageModel?> _result = await Future.wait(_toDo);
    print("Result is $_result");
    print("Todo is $_toDo");

    _result.forEach((element) {
      if (element != null) {
        dogImages.add(element);
      }
    });

    if (dogImages.isEmpty) {
      resultCondition = dogResult.fail;
    } else {
      resultCondition = dogResult.success;
    }
    print("final images $dogImages");
    setState(() {});
    return;
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
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
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
                if (trySearch)
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
                              textCon.clear();
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
                      focusNode: focusNode,
                      controller: textCon,
                      onEditingComplete: () {
                        searchData();
                        resultCondition = dogResult.loading;
                        textToShow.clear();
                        focusNode.unfocus();
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
                if (!trySearch) ...[
                  IconButton(
                      color: Colors.white,
                      splashRadius: 20,
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
          ),

          //body
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
            Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.amber,
                ),
              ),
            )
          ] else if (resultCondition == dogResult.success) ...[
            Expanded(
              child: Center(
                child: Text("Success"),
              ),
            )
          ] else ...[
            Expanded(
              child: Center(
                child: Text("Fail"),
              ),
            )
          ]
        ],
      ),
    );
  }
}

// Guide 21 zoom [53:11]