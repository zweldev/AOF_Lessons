import 'package:aof_lessons/ScrollBuilder/scrollBuilders.dart';
import 'package:aof_lessons/ScrollBuilder/scrollTest.dart';
import 'package:aof_lessons/ScrollBuilder/singleChildScrollView.dart';
import 'package:aof_lessons/courseWorks/image_network.dart';
import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:aof_lessons/courseWorks/image_search/view/home.dart';
import 'package:aof_lessons/namedRoutes/genInit.dart';
import 'package:flutter/material.dart';
import 'namedRoutes/bar.dart';
import 'namedRoutes/home.dart';
import 'namedRoutes/office.dart';
import 'namedRoutes/school.dart';
import 'namedRoutes/unknown.dart';

void main() {
  API_service.instance().available;
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

      // initialRoute: 'scrollBuilders',
      initialRoute: 'scrollTest',

      // initialRoute: 'home',

      // routes: {
      //   'home': (context) => HomePageEXP(),
      //   'school': (context) => SchoolPageEXP(),
      //   'office' : (context) => OfficePageEXP(),
      //   'bar': (context) => BarPageEXP(),
      // },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => GeneratedUnKnownRouteEXP());
      },

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
      // onGenerateInitialRoutes: ((initialRoute) {
      //   return [
      //     MaterialPageRoute(builder: (con) => GeneratedUnKnownRouteEXP())
      //   ];
      // }),

      onGenerateRoute: (settings) {
        print("Ongenerated Route ${settings.arguments}");
        switch (settings.name) {
          case 'home':
            print("Route name is ${settings.name}");
            return MaterialPageRoute(builder: (con) => HomePageEXP());

          case 'school':
            print("Route name is ${settings.name}");
            return MaterialPageRoute(
                builder: (con) => SchoolPageEXP(), fullscreenDialog: true);

          case 'office':
            print("Route name is ${settings.name}");
            return MaterialPageRoute(builder: (con) => OfficePageEXP());

          case 'bar':
            print("Route name is ${settings.name}");
            return MaterialPageRoute(
              builder: (con) => BarPageEXP(
                title: settings.arguments?.toString() ?? "random title",
              ),
            );

          case 'imageNetworkEXP':
            return MaterialPageRoute(builder: (context) => ImageEXP());

          case '\imgHome':
            return MaterialPageRoute(
                builder: (context) => ImageSearchViewEXP());

          case 'singleChildScroll':
            return MaterialPageRoute(
                builder: (context) => SingleChildScrollViewExp());

          case 'scrollTest':
            return MaterialPageRoute(builder: (context) => ScrollTestPageEXP());

          case 'scrollBuilders':
            return MaterialPageRoute(builder: (context) => ScrollBuilders());

          default:
            print("Route name is ${settings.name}");
            return MaterialPageRoute(builder: (con) => UnknownPageEXP());
        }
      },
      // ongenerated initial routes
    );
  }
}

// Guide 18 ongenerate route 
