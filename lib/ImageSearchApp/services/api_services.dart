import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/availabledogs.dart';
import '../models/image_model.dart';

class _API {
  /**
   * 200 => Success
   * 201 => Create => Post(upload file, login ,)
   * 404 => Not Found
   * 401 => Auth
   * 403 => Auth
   * 500 => Server Error
   */
  Future<Map<String, dynamic>?> getData(String uri) async {
    final http.Response a = await http.get(Uri.parse(uri));
    if (a.body == null) return null;
    return jsonDecode(a.body); // Map
  }
}

class Api_Services extends _API {
  //asign instance of getDogList into available
  AvailableDogsModel? available; 
  Api_Services._() {
    getDogList().then((value) {
      if (value != null) {
        available = value;
      }
    });
  }

  //making single instance of API_service
  static Api_Services? _instance;

  static Api_Services instance() {
    _instance ??= Api_Services._();
    return _instance!;
  }

  Future<AvailableDogsModel?> getDogList() async {
    final result = await getData('https://dog.ceo/api/breeds/list/all');
    if (result == null) return null;
    return AvailableDogsModel.fromJSON(result);
  }

  Future<ImageModel?> getDog(String uri) async {
    final _singleDog =
        await getData('https://dog.ceo/api/breeds/$uri/image/random');
    if (_singleDog == null) return null;
    return ImageModel.fromJSON(_singleDog);
  }
}
