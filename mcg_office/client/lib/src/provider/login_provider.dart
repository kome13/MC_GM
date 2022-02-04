import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';

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
  String _user = "";
  String get user => _user;

  void inputAccount(input) {
    print(_user);
    print(input);
    _user = input;

    notifyListeners();
  }
}
