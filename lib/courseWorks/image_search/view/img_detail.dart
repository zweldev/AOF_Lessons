import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailViewEXP extends StatelessWidget {
  String imgUrl;
  ImageDetailViewEXP({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PhotoView(imageProvider: CachedNetworkImageProvider(imgUrl)),
        Positioned(
            top: 30,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 255, 255, 0.7)),
                child: Icon(Icons.close),
              ),
            ))
      ]),
    );
  }
}
