import 'dart:async';

import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:aof_lessons/courseWorks/image_search/model/searchModel.dart';
import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:aof_lessons/courseWorks/image_search/widget/app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageSearchViewEXP extends StatefulWidget {
  const ImageSearchViewEXP({super.key});

  @override
  State<ImageSearchViewEXP> createState() => _ImageSearchViewEXPState();
}

enum dogResult { suggestion, loading, fail, success }

class _ImageSearchViewEXPState extends State<ImageSearchViewEXP> {
  late API_service api;
  int buildTime = 0;
  int didChangeCount = 0;
  StreamController<SearchModel> _stateCon = StreamController.broadcast();

  @override
  void initState() {
    /// code here if you want to program before state initialized
    ///
    _stateCon.stream.listen((event) {
      print(event);
    });
    api = API_service.instance();
    super.initState();
    //// code here if you want to program after state initialized
  }

  @override
  void dispose() {
    //// code heree to program before state disposal
    api.dispose();
    textCon.dispose();
    focusNode.dispose();

    super.dispose();
  }

  // keyboard on/ off works during didChangeDependecies state
  // @override
  // void didChangeDependencies() {
  //   print("Home Screen is built with didChangeDependecy $didChangeCount ");
  //   didChangeCount++;
  //   super.didChangeDependencies();
  // }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  List<String> textToShow = [];
  TextEditingController textCon = TextEditingController();
  FocusNode focusNode = FocusNode();

  dogResult resultCondition = dogResult.suggestion;

  List<ImageModel> dogImages = [];

  void setData() {
    textCon.text = "Please enter a dog name";
    // setState(() {});
  }

  void insertData(String dataEntry) {
    textCon.text = dataEntry;
    focusNode.unfocus();
    // _stateCon.sink.add(SearchModel())

    // setState(() {});
  }

  Future<void> searchData() async {
    _stateCon.sink.add(SearchModel(dogResult.loading));
    dogImages.clear();

    List<Future<ImageModel?>> _toDo =
        List.generate(10, (index) => api.getDog(textCon.text));

    List<ImageModel?> _result = await Future.wait(_toDo);
    // print("Result is $_result");
    // print("Todo is $_toDo");

    _result.forEach((element) {
      if (element != null) {
        dogImages.add(element);
      }
    });

    if (dogImages.isEmpty) {
      // resultCondition = dogResult.fail;
      _stateCon.sink.add(SearchModel(dogResult.fail));
    } else {
      // resultCondition = dogResult.success;
      // _stateCon.sink.add(dogResult.success);
      _stateCon.sink.add(SearchModel(dogResult.success));
    }
    // setState(() {});
    print("Connection test $dogImages");
    // print("final images $dogImages");

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

    print("Home Screen Build time is $buildTime");
    buildTime++;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageSearchAppBarEXP(
                controller: _stateCon,
                search: searchData,
                textCon: textCon,
                fNode: focusNode,
              ),

              //body
              Expanded(
                child: StreamBuilder(
                  stream: _stateCon.stream.distinct(),
                  builder: (context, snapshot) {
                    print("SnapShot Data is $snapshot");
                    if (snapshot.data?.searchResult == dogResult.suggestion) {
                      if (snapshot.data?.suggestion.isNotEmpty == true) {
                        return ListView.builder(
                            itemCount: snapshot.data!.suggestion.length,
                            itemBuilder: (_, i) => InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    insertData(snapshot.data?.suggestion[i]);
                                    searchData();
                                  },
                                  child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [Text(snapshot.data!.suggestion[i])],
                                      )),
                                ));
                      }
                    } else if (snapshot.data?.searchResult == dogResult.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          backgroundColor: Colors.amber,
                        ),
                      );
                    } else if (snapshot.data?.searchResult == dogResult.success) {
                      return RefreshIndicator(
                          onRefresh: searchData,
                          color: Colors.red,
                          child: GridView.count(
                            padding: EdgeInsets.only(bottom: 20),
                            crossAxisCount: 2,
                            children: dogImages
                                .map((e) => InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            'search/detail',
                                            arguments: e.image);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0))),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: e.image,
                                            placeholder: (_, s) => Center(
                                                child:
                                                    CircularProgressIndicator())),
                                      ),
                                    ))
                                .toList(),
                          ));
                      // Card(
                      //         child: CachedNetworkImage(imageUrl: dogImages.map((e) => e.image), placeholder: (_,s) => CircularProgressIndicator(),),
                      //       )
                    } else if (snapshot.data?.searchResult == dogResult.fail) {
                      return Center(
                        child: Text("Fail"),
                      );
                    }
                    return SizedBox();
                  },
                ),
              )
            ],
          ),
          //internet connection
          Positioned(
            bottom: 0,
            child: StreamBuilder(
              stream: api.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data != true) {
                    return Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "No Internet Connection",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    );
                  }
                }

                return SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}

// Guide 22 zoom [34:26]
