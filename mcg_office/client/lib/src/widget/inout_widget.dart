import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';

// listview 만드는과정 , 오류 발생 : listview가 안나옴
class InoutWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // 기본 컨테이너 단위로 묶어서
        child: ListView(
            scrollDirection: Axis.vertical, children: <Widget>[_listTest()]));
  }

  // listview 생성 위젯
  Widget _listTest() {
    return Container(
        color: Colors.white,
        height: 70,
        child: const Center(child: Text('ENTRY A')));
  }
}
