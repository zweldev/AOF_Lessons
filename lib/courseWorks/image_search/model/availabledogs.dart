import 'dart:async';

class AvailableDogs {
  List<String> dogs = [];

  AvailableDogs._(this.dogs);

  factory AvailableDogs.fromJSON(Map<String, dynamic> dogs) {
    List<String> dogLists = [];

    final Map _message = dogs['message'] as Map;
    _message.forEach((key, value) {
      dogLists.add(key.toString());
    });
    print("Dog Lists is ${dogLists}");
    return AvailableDogs._(dogLists);
  }
}
