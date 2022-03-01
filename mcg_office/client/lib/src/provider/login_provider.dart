import 'package:flutter/foundation.dart';
import 'package:mcg_office/src/model/userinfo.dart';
import 'package:mcg_office/src/repository/login_repository.dart';

enum Status { unauthentication, authenticatied } // 비인증, 인증 중, 인증 완료

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
  UserInfoRepository _userInfoRepository = UserInfoRepository();
  List<UserInfo> _userinfos = [];
  List<UserInfo> get userinfos => _userinfos;
  Status _status = Status.unauthentication; // 기본상태 비인증
  Status get status => _status;

  Future<bool> login(String id, String password) async {
    List<UserInfo>? listUserInfos =
        await _userInfoRepository.login(id, password);
    //
    print("777");

    //추가적인 가공절차, 예외처리
    if (listUserInfos != null) {
      _userinfos = listUserInfos;
      _status = Status.authenticatied; // 인증 완료
      return true;
    } else {
      return false;
    }
  }

  void Listener() {
    notifyListeners();
  }

  void init() {
    _userinfos = [];
    _status = Status.unauthentication; // 인증실패
    notifyListeners();
  }
}
