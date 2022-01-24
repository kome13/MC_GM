import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  int _count = 0; // _추가하여 외부접근 방지.
  int get count => _count;

  add() {
    _count++;
    notifyListeners();
  }

  remove() {
    _count--;
    notifyListeners();
  }
}
