import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mcg_office/src/provider/login_provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamed(context,
            'landing')); // 3초뒤에 프로바이더 이용 상태 Uninitialized에서 Unauthenticated로 변경됨으로써 로그인 화면으로 전환

    return Material(
      child: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
