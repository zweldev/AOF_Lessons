import 'dart:math';

import 'package:flutter/cupertino.dart';

class ChangeNotiProviderEXP extends ChangeNotifier {
  List items = [];

  Random _random = Random();

  void refresh() {
    items = List.generate(_random.nextInt(10), (index) => _random.nextInt(10));
    notifyListeners();
  }
}
