import 'package:flutter/foundation.dart';

class IdCheckProvider extends ChangeNotifier {
  bool _isNotifiable = false; // _추가하여 외부접근 방지.

  bool get isNotifiable => _isNotifiable;

  void toggleNotification({bool isNotifiable = true}) {
    // ? 바꾸는 함순데
    this._isNotifiable = isNotifiable; //
    notifyListeners();
  }
}

class Loginbutton extends ChangeNotifier {
  Map data = {'id': '', 'password': ''};

  void inputAccount(input) {
    data = input;
    notifyListeners();
  }
}
