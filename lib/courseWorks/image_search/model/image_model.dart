import 'package:flutter/cupertino.dart';

class ImageModel {
  String image;
  ImageModel._(this.image);

  factory ImageModel.fromJSON(Map<String, dynamic> data) {
    final String dogImage = data['message'].toString();
    // print("DogImage link is ${dogImage}");
    return ImageModel._(dogImage);
  }
}
