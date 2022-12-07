import 'dart:io';

import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Network"),
      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 400,
            color: Colors.green,
            child: Image.network(
              'https://foodburma.com/wp-content/uploads/2021/12/friends.jpg',
              loadingBuilder: ((context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                );
              }),
              errorBuilder: (_, a, b) => Icon(Icons.error),
              width: 100,
              height: 100,
              // fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
              repeat: ImageRepeat.repeat,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.file(File("image path from phone")),
        ],
      ),
    );
  }
}


// Guide 19 1.image 9:35