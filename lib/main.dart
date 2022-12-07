
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImageSearchApp/services/api_services.dart';
import 'ImageSearchApp/view/image_search_home.dart';
import 'courseWorks/drawer.dart';
import 'namedRoutes/bar.dart';
import 'namedRoutes/home.dart';
import 'namedRoutes/office.dart';
import 'namedRoutes/school.dart';
import 'namedRoutes/unknown.dart';

void main() {
  Api_Services.instance();
  // Api_Services.getData('https://dog.ceo/api/breeds/image/random');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //onGeneratedRoutes
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      ///Named Routes
      initialRoute: "home",
      routes: {
        "home": (context) => Home(),
        "bar": (context) => Bar(),
        "office": (context) => Office(),
        "school": (context) => School(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => UnknownScreen()),
      //named routes

      onGenerateRoute: (setting) {
        switch (setting.name) {
          // case "/":
          //   return MaterialPageRoute(builder: (context) => ImageProviderExp());

          case "/drawer":
            return MaterialPageRoute(builder: (context) => DrawerExp());

          case "/img_search":
            return MaterialPageRoute(
                builder: (context) => ImageSearchHomeScreen());
        }
      },
      //ongenerated initial routes
      // onGenerateInitialRoutes: (initialRoute) {
      //   return [MaterialPageRoute(builder: (context) => ImageNetwork())];
      // },
    );
  }
}

// 1:01:41
