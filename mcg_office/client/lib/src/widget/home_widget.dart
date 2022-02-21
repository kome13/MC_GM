import 'package:flutter/material.dart';
import 'package:mcg_office/src/component/inout.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/widget/inout_widget.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 기본 컨테이너 단위로 묶어서
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        _listTest(),
        _inoutButton(),
        _SelectButton(),
      ]),
    );

    // ignore: dead_code
  }

  // listview 생성 위젯
  Widget _listTest() {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30), //
        color: Colors.white,
        height: 70,
        child: const Center(
            child: Text(
          '계량기정보 list',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300, // 타이틀 폰트 굵기 설정.
          ),
        )));
  }

  // + 버튼생성
  Widget _inoutButton() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30), //
      width: double.infinity,
      height: 150,
      child: ElevatedButton(
        onPressed: () {
          // 버튼 수행 시
          //print("22");
        },
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.white), //텍스트색깔
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blue.shade500), //배경색
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //모서리
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue.shade100) // 모서리 라인 색
                ),
          ),
        ),
        child: Icon(
          Icons.add,
          size: 70.0,
        ),
      ),
    );
  }

  // 확인 버튼생성
  Widget _SelectButton() {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20), //
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          //print("22");
        },
        child: Text(
          "확인",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300, // 타이틀 폰트 굵기 설정.
          ),
        ),
      ),
    );
  }
}
