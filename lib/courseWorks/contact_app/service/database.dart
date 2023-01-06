import 'package:localstore/localstore.dart';

class ContactAppDataBase {
  Localstore _instance = Localstore.instance;

  //Stream
  Stream<Map<String, dynamic>> collectionStream(String path) =>
      _instance.collection(path).stream;

  //write (create, update)
  Future<dynamic> write(String path, Map<String, dynamic> data, {String? id}) =>
      _instance.collection(path).doc(id).set(data);  

  //delete
  Future<dynamic> delete(String path, String id) =>
      _instance.collection(path).doc(id).delete();
}
