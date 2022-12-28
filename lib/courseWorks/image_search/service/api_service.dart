import 'dart:convert';
import 'package:aof_lessons/courseWorks/image_search/model/availabledogs.dart';
import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:http/http.dart' as http;

class _API {
  /**
   * 200 => success
   * 201 => Create => File, Login, Register
   * 
   * 404 => Not Found
   * 401 => Auth
   * 403 => Auth
   * 500 => Server Error
   */
  Future<Map<String, dynamic>?> get(String url) async {
    final http.Response _result = await http.get(Uri.parse(url));
    print(_result.statusCode);
    if (_result == null) {
      return null;
    }
    return jsonDecode(_result.body);
  }
}

class API_service extends _API {
  AvailableDogs? available;

//constructor
  API_service._() {
    getDogs().then((value) {
      available = value;
      print("available htal htae pee per v ${available?.dogs}");
    });
  }

  //single instance
  static API_service? _instance;
  static API_service instance() {
    _instance ??= API_service._();
    print("D mar $_instance");
    return _instance!;
  }

  Future<ImageModel?> getDog(String dogUrl) async {
    final Map<String, dynamic>? dogImg = await get( "https://dog.ceo/api/breed/$dogUrl/images/random");
    if (dogImg == null) {
      return null;
    }
    return ImageModel.fromJSON(dogImg);
  }

  Future<AvailableDogs?> getDogs() async {
    final dogLists = await get('https://dog.ceo/api/breeds/list/all');
    if (dogLists == null) {
      print("null fik nay per tel");
      return null;
    }
    return AvailableDogs.fromJSON(dogLists);
  }
}
