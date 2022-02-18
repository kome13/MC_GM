import 'package:flutter/material.dart';

class ButtomNavigationProvider extends ChangeNotifier {
  int _index = 0; // index 반환 페이지
  int get currentNavigationIndex => _index; //get함수 외부에서 접근가능.
  updatePage(int index) {
    _index = index;
    notifyListeners(); //notifyListerners ?
  }
}
