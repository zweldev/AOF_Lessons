import 'package:flutter/material.dart';

class ImageModel {
  String image;
  ImageModel._(this.image);

  factory ImageModel.fromJSON(Map<String, dynamic> data) =>
      ImageModel._(data['message'].toString());
}
