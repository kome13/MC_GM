import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';

// listview 만드는과정 , 오류 발생 : listview가 안나옴
class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // 기본 컨테이너 단위로 묶어서
        child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[_listTest(), _inoutButton(), _SelectButton()]));
  }

  // listview 생성 위젯
  Widget _listTest() {
    return Container(
        color: Colors.white,
        height: 70,
        child: const Center(child: Text('ENTRY A')));
  }

  // + 버튼생성
  Widget _inoutButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("+", style: TextStyle(fontSize: 130)),
    );
  }

  // 확인 버튼생성
  Widget _SelectButton() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5), //
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          //print("22");
        },
        child: Text("확인"),
      ),
    );
  }
}
