
// import 'package:flutter/material.dart';

// import '../services/api_services.dart';



// enum DogResult { success, error, loading, none }

// class ImageSearchHomeScreen extends StatefulWidget {
//   ImageSearchHomeScreen({Key? key}) : super(key: key);

//   @override
//   State<ImageSearchHomeScreen> createState() => _ImageSearchHomeScreenState();
// }

// class _ImageSearchHomeScreenState extends State<ImageSearchHomeScreen> {
//   List<String> suggestionItems = [];
//   TextEditingController text_ctrl = TextEditingController();

//   FocusNode _focusNode = FocusNode();

//   bool want_to_search = false;

//   DogResult condition = DogResult.none;

//   // void setData() {
//   //   text_ctrl.text = "hello mg";
//   //   setState(() {});
//   // }

//   void insertData(String txt) {
//     text_ctrl.text = txt;
//     _focusNode.unfocus();
//     setState(() {});
//   }

//   void searchData() {
//     Future.delayed(Duration(seconds: 3), () {
//       try{
//         Api_Services.instance().available!.dogNames.firstWhere((element) {
//           return element == text_ctrl.text;
//         } );
//         condition == DogResult.success;
//       } catch (e) {
//         condition == DogResult.error;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print("Home Page Data ${Api_Services.instance().getDogList()}");
//     return Scaffold(
//         appBar: AppBar(
//           title: want_to_search
//               ? TextField(
//                   focusNode: _focusNode,
//                   controller: text_ctrl,
//                   onEditingComplete: () {
//                     searchData();
//                     suggestionItems.clear();
//                     _focusNode.unfocus();
//                     condition = DogResult.loading;
//                     setState(() {});
//                   },
//                   onChanged: (searchData) {
//                     List<String>? data =
//                         // Api_Services.instance().available?.dogNames;

//                     suggestionItems.clear();

//                     if (searchData.isEmpty) {
//                       setState(() {});
//                       return;
//                     }

//                     if (data != null) {
//                       suggestionItems.addAll(data
//                           .where((element) => element.contains(searchData))
//                           .toList());
//                     }

//                     setState(() {});
//                   },
//                 )
//               : null,
//           actions: [
//             if (!want_to_search)
//               IconButton(
//                   onPressed: () {
//                     _focusNode.requestFocus();
//                     want_to_search = !want_to_search;
//                     setState(() {});
//                   },
//                   icon: Icon(Icons.search))
//           ],
//         ),
//         body: SizedBox(
//           // height: 00,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // ElevatedButton(onPressed: setData, child: Text("Set")),
//               if (condition == DogResult.loading) ...[
//                 Center(
//                   child: CircularProgressIndicator(),
//                 )
//               ] else if (condition == DogResult.none) ...[
//                 if (suggestionItems.isNotEmpty)

//                   // never forget to provide height on listview widgets
//                   SizedBox(
//                     height: 400,
//                     child: SizedBox(
//                       height: 400,
//                       child: ListView.builder(
//                           itemCount: suggestionItems.length,
//                           itemBuilder: ((context, index) => InkWell(
//                                 onTap: () {
//                                   insertData(suggestionItems[index]);
//                                 },
//                                 child: Container(
//                                   height: 35,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Text("${suggestionItems[index]}"),
//                                 ),
//                               ))),
//                     ),
//                   )
//               ] else if (condition == DogResult.success) ...[
//                 Text("Success")
//               ] else ...[
//                 Text("Error")
//               ]
//             ],
//           ),
//         ));
//   }
// }
  
//   // @override
//   // Widget build(BuildContext context) {
//   //   // TODO: implement build
//   //   throw UnimplementedError();
//   // }

