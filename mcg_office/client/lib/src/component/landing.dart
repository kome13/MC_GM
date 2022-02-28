import 'package:flutter/material.dart';
import 'package:mcg_office/src/component/back.dart';
import 'package:mcg_office/src/component/home.dart';
import 'package:mcg_office/src/component/login.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _landingbody() {
      print('print landing');
      switch (context.watch<Loginbutton>().status) {
        case Status.unauthentication:
        case Status.authenticating:
          // return Navigator.pushNamed(context, 'home'); //수불등록
          return Login();
        case Status.authenticatied:
          // return Navigator.pushNamed(context, 'inventory'); //재고현황
          return Back();
          break;
      } //case3. 내역조회 추가하기
      return Container();
    }

    return Scaffold(
        resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
        body: _landingbody());
  }
}
