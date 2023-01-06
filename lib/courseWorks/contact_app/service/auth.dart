import 'dart:async';

import 'package:aof_lessons/courseWorks/contact_app/model/user_model.dart';
import 'package:aof_lessons/courseWorks/contact_app/service/database.dart';
import 'package:aof_lessons/courseWorks/contact_app/utils/constant.dart';
import 'package:starlight_http_cached/starlight_http_cached.dart';

class ContactAppAuthService extends ContactAppDataBase {
  StreamController _auth = StreamController.broadcast();
  Stream get auth => _auth.stream;

  List exist = ['a', 'b'];

  ContactAppAuthService() {
    collectionStream(AUTH).listen((event) {
      print(event);
      exist.add(event['username']);
      return _auth.sink.add(event);
    });
  }

  void login() {}

  Future<void> register(ContactAppUser user) async {
    write(AUTH, user.toMap());

    //setting cache
    StarlightHttpCached.setCached(name: AUTH, data: user.toMap());
  }

  //logout
  static void logOut() {
    StarlightHttpCached.deleteCached(name: AUTH);
  }
}
