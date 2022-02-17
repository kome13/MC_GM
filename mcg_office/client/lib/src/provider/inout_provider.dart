import 'package:flutter/foundation.dart';
import 'package:mcg_office/src/model/inoutinfo.dart';

class InoutProvider extends ChangeNotifier {
  String _firstList = "";
  String _secondList = "";
  String _thirdList = "";
  String _fourthList = "";
  String _fifthList = "";

  String get firstList => _firstList;
  String get secondList => _secondList;
  String get thirdList => _thirdList;
  String get fourthList => _fourthList;
  String get fifthList => _fifthList;

  // int count = 0;
  // int stock = 0;

  // List<InoutInfo> _inoutinfo = [];

  void selectButton(String title, String text) {
    switch (title) {
      case '수불구분':
        _firstList = text;
        break;
      case '계량기구분':
        _secondList = text;
        break;
      case '계량기등급':
        _thirdList = text;
        break;
      case '유형코드':
        _fourthList = text;
        break;
      case '계량기타입':
        _fifthList = text;
        break;
    }
    notifyListeners();
  }
}
