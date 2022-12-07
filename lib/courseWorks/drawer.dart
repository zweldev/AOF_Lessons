import 'package:flutter/material.dart';

class DrawerExp extends StatefulWidget {
  DrawerExp({Key? key}) : super(key: key);

  @override
  State<DrawerExp> createState() => _DrawerExpState();
}

class _DrawerExpState extends State<DrawerExp> {
  GlobalKey<ScaffoldState> scafstate = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        leading: IconButton(
          onPressed: () {
            scafstate.currentState?.openEndDrawer();
          },
          icon: Icon(Icons.open_in_browser),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.open_in_browser),
        //     onPressed: () {
        //       scafstate.currentState?.openEndDrawer();
        //     },
        //   ),
        // ],
      ),

      //
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.amber,
      ),

      //end-drawer
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.red,
      ),

      //
      onDrawerChanged: (isOpened) {
        print(isOpened);
      },

      //
      onEndDrawerChanged: (isOpened) {
        print(isOpened);
      },

      drawerEdgeDragWidth: 200,

      drawerScrimColor: Colors.blue.withOpacity(.4),
    );
  }
}


