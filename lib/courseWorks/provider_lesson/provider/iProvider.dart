import 'package:flutter/cupertino.dart';

class I_provider extends ChangeNotifier {
  int i = 0;

  void increase() {
    i++;
    notifyListeners();
    print("in $i");
  }

  void decrease() {
    i--;
    notifyListeners(); 
    print("de $i");
  }
}
  