import 'dart:async';
import 'dart:convert';
import 'package:aof_lessons/courseWorks/image_search/model/availabledogs.dart';
import 'package:aof_lessons/courseWorks/image_search/model/image_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

Connectivity _connectivity = Connectivity();

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
  void dispose() {
    _instance = null;
    _streamController.close();
  }

  StreamController<bool> _streamController = StreamController.broadcast();
  Stream<bool> get stream => _streamController.stream;

  AvailableDogs? available;

  //constructor
  API_service._() {
    _connectivity.checkConnectivity().then((value) {
      //if there is no connection, input data will be false
      //if there is connection, input data will be true
      _streamController.sink.add(value != ConnectivityResult.none);
    });

    _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult event) {
        print("Connectivity is $event");
        _streamController.sink.add(event != ConnectivityResult.none);
      },
    );

    stream.listen((event) {
      if (event) {
        if (available == null) {
          getDogs().then((value) {
            available = value;
          });
        }
      }
    });
  }

  //single instance
  static API_service? _instance;
  static API_service instance() {
    _instance ??= API_service._();
    // print("D mar $_instance");

    return _instance!;
  }

  Future<ImageModel?> getDog(String dogUrl) async {
    final Map<String, dynamic>? dogImg =
        await get("https://dog.ceo/api/breed/$dogUrl/images/random");
    if (dogImg == null) {
      return null;
    }
    if (dogImg['status'] == "error") return null;
    return ImageModel.fromJSON(dogImg);
  }

  Future<AvailableDogs?> getDogs() async {
    final dogLists = await get('https://dog.ceo/api/breeds/list/all');
    // final dogLists = await get(' ');
    if (dogLists == null) {
      return null;
    }

    if (dogLists['status'] == 'error') return null;
    return AvailableDogs.fromJSON(dogLists);
  }
}
