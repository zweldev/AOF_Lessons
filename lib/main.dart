import 'package:aof_lessons/courseWorks/ScrollBuilder/scrollBuilders.dart';
import 'package:aof_lessons/courseWorks/ScrollBuilder/scrollTest.dart';
import 'package:aof_lessons/courseWorks/ScrollBuilder/singleChildScrollView.dart';
import 'package:aof_lessons/courseWorks/alert_dialog_exp.dart';
import 'package:aof_lessons/courseWorks/bottom_sheet.dart';
import 'package:aof_lessons/courseWorks/contact_app/model/user_model.dart';
import 'package:aof_lessons/courseWorks/contact_app/screen/auth_screen.dart';
import 'package:aof_lessons/courseWorks/contact_app/screen/home_screen.dart';
import 'package:aof_lessons/courseWorks/contact_app/screen/security_question.dart';
import 'package:aof_lessons/courseWorks/contact_app/service/auth.dart';
import 'package:aof_lessons/courseWorks/contact_app/utils/constant.dart';
import 'package:aof_lessons/courseWorks/futurebuilder.dart';
import 'package:aof_lessons/courseWorks/image_network.dart';
import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:aof_lessons/courseWorks/image_search/service/api_service.dart';
import 'package:aof_lessons/courseWorks/image_search/view/home.dart';
import 'package:aof_lessons/courseWorks/image_search/view/img_detail.dart';
import 'package:aof_lessons/courseWorks/indicators.dart';
import 'package:aof_lessons/courseWorks/listtile.dart';
import 'package:aof_lessons/courseWorks/namedRoutes/bar.dart';
import 'package:aof_lessons/courseWorks/namedRoutes/home.dart';
import 'package:aof_lessons/courseWorks/namedRoutes/office.dart';
import 'package:aof_lessons/courseWorks/namedRoutes/school.dart';
import 'package:aof_lessons/courseWorks/namedRoutes/unknown.dart';
import 'package:aof_lessons/courseWorks/provider_lesson/change_notifier_home.dart';
import 'package:aof_lessons/courseWorks/provider_lesson/provider/change_notifier_provider.dart';
import 'package:aof_lessons/courseWorks/provider_lesson/provider/iProvider.dart';
import 'package:aof_lessons/courseWorks/provider_lesson/provider_home.dart';
import 'package:aof_lessons/courseWorks/safeArea.dart';
import 'package:aof_lessons/courseWorks/sizedbox.dart';
import 'package:aof_lessons/courseWorks/snackbar.dart';
import 'package:aof_lessons/courseWorks/streambuilder.dart';
import 'package:aof_lessons/courseWorks/testPage.dart';
import 'package:aof_lessons/courseWorks/willpopscope.dart';
import 'package:aof_lessons/courseWorks/wrap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight_http_cached/starlight_http_cached.dart';
import 'package:starlight_utils/starlight_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StarlightHttpCached.instance;
  //logout
  // ContactAppAuthService.logOut();
  print(
      ContactAppUser(username: "Kyaw Kyaw", pass: "zwelhtet44").cryptPassword);
  print("Cached is ${StarlightHttpCached.getCached(name: AUTH)}");
  API_service.instance();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => I_provider()),
        ChangeNotifierProvider(create: (context) => ChangeNotiProviderEXP()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,

          // initialRoute: 'scrollBuilders',
          // initialRoute: 'scrollTest',
          // initialRoute: 'listTileEXP',

          // initialRoute: 'home',

          // routes: {
          //   'home': (context) => HomePageEXP(),
          //   'school': (context) => SchoolPageEXP(),
          //   'office' : (context) => OfficePageEXP(),
          //   'bar': (context) => BarPageEXP(),
          // },

          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (context) => AlertDialogEXP());
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

              case 'imgHome':
                return MaterialPageRoute(
                    builder: (context) => ImageSearchViewEXP());

              case 'singleChildScroll':
                return MaterialPageRoute(
                    builder: (context) => SingleChildScrollViewExp());

              case 'scrollTest':
                return MaterialPageRoute(
                    builder: (context) => ScrollTestPageEXP());

              case SECURITY:
                return MaterialPageRoute(
                  builder: (context) => ContactSecurityQuestion(),
                );

              case 'scrollBuilders':
                return MaterialPageRoute(
                    builder: (context) => ScrollBuilders());

              case 'listTileEXP':
                return MaterialPageRoute(builder: (context) => ListTileEXP());

              case 'search/detail':
                return MaterialPageRoute(
                    builder: (builder) => ImageDetailViewEXP(
                        imgUrl: settings.arguments.toString()));

              default:
                print("Route name is ${settings.name}");
                return MaterialPageRoute(builder: (con) => UnknownPageEXP());
            }
          },
          onGenerateInitialRoutes: (initialRoute) => [
                MaterialPageRoute(builder: (context) {
                  try {
                    // if there is no cache , 'StarlightHttpCached.getCached(name: AUTH)' will throw ERROR
                    return ContactAppUser.fromDynamic(
                                    StarlightHttpCached.getCached(name: AUTH))
                                .question1 ==
                            null
                        ? ContactSecurityQuestion()
                        : ContactAppHomeScreen();
                  } catch (val) {
                    // if 'StarlightHttpCached.getCached(name: AUTH)' , throw below
                    return ContactAppAuthScreen();
                  }
                })
              ]
          // ongenerated initial routes
          ),
    );
  }
}

 
// Guide 24, Zoom 1:07 (ContactAppSecurityScreen UI)
