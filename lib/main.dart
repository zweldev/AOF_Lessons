import 'package:aof_lessons/namedRoutes/genInit.dart';
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
  // Api_Services.instance();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      ///Named Routes
      // initialRoute: "home",
      // routes: {
      //   "home": (context) => Home(),
      //   "bar": (context) => Bar(),
      //   "office": (context) => Office(),
      //   "school": (context) => School(),
      // },
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => UnknownScreen()),
      //named routes

      //ongenerateroute
      onGenerateInitialRoutes: ((initialRoute) {
        return [MaterialPageRoute(builder: (con) => OngenerateInitialPage())];
      }),

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return MaterialPageRoute(builder: (con) => Home());

          case 'school':
            return MaterialPageRoute(builder: (con) => School());

          case 'office':
            return MaterialPageRoute(builder: (con) => Office());

          case 'bar':
            return MaterialPageRoute(builder: (con) => Bar());

          default:
            return MaterialPageRoute(builder: (con) => UnknownScreen());
        }
      },
      //ongenerated initial routes
      // onGenerateInitialRoutes: (initialRoute) {
      //   return [MaterialPageRoute(builder: (context) => ImageNetwork())];
      // },
    );
  }
}

// Guide 18 ongenerate route 
