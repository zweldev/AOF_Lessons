import 'package:flutter/material.dart';

class SingleChildScrollViewExp extends StatefulWidget {
  SingleChildScrollViewExp({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollViewExp> createState() =>
      _SingleChildScrollViewExpState();
}

class _SingleChildScrollViewExpState extends State<SingleChildScrollViewExp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Builder'),
      ),
      body: singleChild(),
      // body: GridViewExp(),
      // body: ListViewExp(),
    );
  }
}

//SingleChildScrollView
class singleChild extends StatefulWidget {
  const singleChild({Key? key}) : super(key: key);

  @override
  State<singleChild> createState() => _singleChildState();
}

class _singleChildState extends State<singleChild> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(
      () => print(_controller.offset),
    );
    return SingleChildScrollView(
      reverse: false,
      controller: _controller,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          for (int i = 0; i < 100; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container01(i: i),
            )
        ],
      ),
    );
  }
}

//ListView
class ListViewExp extends StatelessWidget {
  const ListViewExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: false,
      itemExtent: 100,
      children: [for (int i = 0; i < 100; i++) Container01(i: i)],
    );
  }
}

//GridView
class GridViewExp extends StatelessWidget {
  const GridViewExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        children: [
          for (int i = 0; i < 100; i++) Container01(i: i),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 50,
            mainAxisExtent: 200,
            crossAxisSpacing: 50,
            childAspectRatio: 20));
  }
}

//Container
class Container01 extends StatelessWidget {
  final int i;
  const Container01({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build Number is $i');
    return Container(
      margin: EdgeInsets.all(10),
      child: Text('$i'),
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.amber,
    );
  }
}
