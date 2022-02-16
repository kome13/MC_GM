import 'package:flutter/material.dart';

// 리스트 구성요소 출력.
List _firstList = ['출고', '입고(검정대기)', '입고(폐기대기']; // 수불구분
List _secondList = ['신품', '검정품']; // 계량기구분
List _thirdList = ['막식2', '막식4', '막식6']; // 계량기등급
List _fourthList = ['일반', '유선', '다기능', '디지털', '누출알림']; // 유형코드
List _fifthList = ['좌', '우', '옆우', '옆좌']; //계량기타입
List _title = ['수불구분', '계량기구분', '계량기등급', '유형코드', '계량기타입'];
List _list = [_firstList, _secondList, _thirdList, _fourthList, _fifthList];

class InoutWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          for (var j = 0; j < _title.toList().length; j++)
            _buttonList(_title[j], _list[j]),
        ],
      ),
    );
  }

  Widget _buttonList(String title, List num) {
    return Container(
      child: Column(children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        Wrap(alignment: WrapAlignment.center, spacing: 10, children: [
          for (var i = 0; i < num.length; i++) _wrapButton(num[i]),
        ])
      ]),
    );
  }

  Widget _wrapButton(String text) {
    return Container(
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text, // 텍스트 내용 출력
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
