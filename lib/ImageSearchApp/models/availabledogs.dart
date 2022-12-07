import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AvailableDogsModel {
  List<String> dogNames = [];
  AvailableDogsModel._(this.dogNames);

  factory AvailableDogsModel.fromJSON(Map<String, dynamic> data) {
    final List<String> _datas = [];

    final message = data['message'] as Map;

    message.forEach((key, value) {
      _datas.add(key.toString());
    });

    return AvailableDogsModel._(_datas);
  }

  //important
  // Map<String, dynamic> toJson() => {
  //    'dogNames' : dogNames,
  // };
  // uneccessary cuz we r using list<String>
}
