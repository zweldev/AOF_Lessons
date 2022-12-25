// ListView , GridView Needs for loop to build widgets
// ListView.builder , GrideView.builder needs no loop, they have item count

// SingleChild builds widgets ahead and the rest build when its needed

import 'package:aof_lessons/ScrollBuilder/singleChildScrollView.dart';
import 'package:flutter/material.dart';


class ScrollBuilders extends StatefulWidget {
  ScrollBuilders({Key? key}) : super(key: key);

  @override
  State<ScrollBuilders> createState() => _ScrollBuildersState();
}

class _ScrollBuildersState extends State<ScrollBuilders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Builder'),
      ),
      // body: ListViewBuildExp(),
      // body: ListViewSeperatedExp(),
      // body: ListViewCustomExp(),
      // body: GridViewBuilder(),
      // body: ListViewExp(),
      body: singleChild(),
      // body: GridViewCountExp(),
      // body: GridViewExtent(),
      // body: SingleChildScrollViewExp(),
    );
  }
}

//ListView.builder
class ListViewBuildExp extends StatefulWidget {
  ListViewBuildExp({Key? key}) : super(key: key);

  @override
  State<ListViewBuildExp> createState() => _ListViewBuildExpState();
}

class _ListViewBuildExpState extends State<ListViewBuildExp> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => Container02(i: i),
      itemCount: 20,
    );
  }
}

//LsitView.Seperated
class ListViewSeperatedExp extends StatefulWidget {
  ListViewSeperatedExp({Key? key}) : super(key: key);

  @override
  State<ListViewSeperatedExp> createState() => _ListViewSeperatedExpState();
}

class _ListViewSeperatedExpState extends State<ListViewSeperatedExp> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, i) => Container02(i: i),
        separatorBuilder: (_, i) => Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
        itemCount: 22);
  }
}

//ListViewCustom
class ListViewCustomExp extends StatefulWidget {
  ListViewCustomExp({Key? key}) : super(key: key);

  @override
  State<ListViewCustomExp> createState() => _ListViewCustomExpState();
}

class _ListViewCustomExpState extends State<ListViewCustomExp> {
  @override
  Widget build(BuildContext context) {
    return ListView.custom(
        childrenDelegate: SliverChildListDelegate.fixed([
      for (int i = 0; i < 100; i++) Container02(i: i),
    ]));
  }
}

//GridView.builder
class GridViewBuilder extends StatefulWidget {
  GridViewBuilder({Key? key}) : super(key: key);

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, i) => Container02(i: i));
  }
}

//GridView.Count
class GridViewCountExp extends StatefulWidget {
  GridViewCountExp({Key? key}) : super(key: key);

  @override
  State<GridViewCountExp> createState() => _GridViewCountExpState();
}

class _GridViewCountExpState extends State<GridViewCountExp> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 10,
      children: [for (int i = 0; i < 101; i++) Container02(i: i)],
    );
  }
}

//GridView.extent
class GridViewExtent extends StatefulWidget {
  GridViewExtent({Key? key}) : super(key: key);

  @override
  State<GridViewExtent> createState() => _GridViewExtentState();
}

class _GridViewExtentState extends State<GridViewExtent> {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      children: [for (int i = 0; i < 100; i++) Container02(i: i)],
    );
  }
}

//Container
class Container02 extends StatelessWidget {
  final int i;
  const Container02({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BuildNUmber is $i');
    return Container(
      margin: EdgeInsets.all(10),
      child: Text('$i'),
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.red,
    );
  }
}
