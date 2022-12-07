import 'package:flutter/material.dart';

class ImageProviderExp extends StatelessWidget {
  const ImageProviderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Provider"),
      ),
      body: Column(
        children: [

          // NetWork Image
          // Container(
          //   width: 300,
          //   height: 300,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               "https://foodburma.com/wp-content/uploads/2021/12/chaw.jpg"))),
          // )

          // File Image
          // Container(
          //   width: 300,
          //   height: 300,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: FileImage()
          //           )),
          // )
        ],
      ),
    );
  }
}
