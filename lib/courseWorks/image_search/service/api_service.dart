import 'dart:convert';
import 'package:aof_lessons/courseWorks/image_search/model/availabledogs.dart';
import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:http/http.dart' as http;

class _API {
  Future<Map<String, dynamic>?> get(String url) async {
    final http.Response _result = await http.get(Uri.parse(url));
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
    });
  }

  //single instance
  static API_service? _instance;
  static API_service instance() {
    _instance ??= API_service._();
    return _instance!;
  }

  Future<ImageModel?> getDog(String dogUrl) async {
    final Map<String, dynamic>? dogImg =
        await get(dogUrl);
    if (dogImg == null) {
      return null;
    }
    return ImageModel.fromJSON(dogImg);
  }

  Future<AvailableDogs?> getDogs() async {
    final dogLists = await get('https://dog.ceo/api/breeds/list/all');
    if (dogLists == null) {
      return null;
    }
    return AvailableDogs.fromJSON(dogLists);
  }
}
