import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/inout_provider.dart';
import 'package:provider/provider.dart';

// 리스트 구성요소 출력.
List _firstList = [
  '출고',
  '     입고               (검정대기)',
  '     입고               (폐기대기)'
]; // 수불구분
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
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 2.0, color: Colors.grey),
              bottom: BorderSide(width: 2.0, color: Colors.grey))),
      child: ListView(
        children: [
          for (var j = 0; j < _title.toList().length; j++)
            _buttonList(_title[j], _list[j], j, context), //텍스트와 리스트 넘김.
          _countList(),
        ],
      ),
    );
  }

  // 타이틀, 버튼리스트 한세트 구성
  Widget _buttonList(String title, List num, int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        _filterText(title),
        Wrap(alignment: WrapAlignment.start, children: [
          for (var i = 0; i < num.length; i++)
            _wrapButton(title, num[i], index, context),
        ])
      ]),
    );
  }

  Widget _filterText(String title) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.orange, width: 2.0))),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }

  // 버튼 위젯
  Widget _wrapButton(
      String title, String text, int index, BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      margin: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          context.read<InoutProvider>().selectButton(title,
              text); // 입력함수에 사용. provider.of<InouProvider>(contex,listen:false)와 동일
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
          foregroundColor: MaterialStateProperty.all(
            //foregroundColor : 글자색
            //모든 상태에따라 아래 색상표기
            Colors.white, // 글자색
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            // bakcgroundColor : 배경색
            // 버튼 상태에따라 색상 변경
            (Set<MaterialState> states) {
              var list = context.watch<InoutProvider>(); // provider 호출
              if (list.firstList == text || // 각각요소 변수 입력 상태 검사 후 내용있는것만 파란색 변경
                  list.secondList == text ||
                  list.thirdList == text ||
                  list.fourthList == text ||
                  list.fifthList == text) {
                return Colors.blue;
              } else {
                return Colors.grey; //없을 시 background 배경 회색처리.
              }
            },
          ),
        ),
        child: Text(
          text, // 텍스트 내용 출력
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _countList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [_amountText(), _amount()],
          ),
          Row(
            children: [_stockText(), _stock()],
          ),
          Row(
            children: [
              _notetext(),
              _note(),
            ],
          ),
          Row(
            children: [
              _okButton(),
              _cancelButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _amountText() {
    return Flexible(
        // flex 사용한 위젯씌우고
        flex: 1, // flex 사용
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          height: 80,
          child: Text(
            "수량",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _amount() {
    return Flexible(
        flex: 3,
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          height: 80,
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: Colors.grey)),
          child: Text(
            " 수량입력 ",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _stockText() {
    return Flexible(
        // flex 사용한 위젯씌우고
        flex: 1, // flex 사용
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          height: 80,
          child: Text(
            "재고",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _stock() {
    return Flexible(
        flex: 3,
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          height: 80,
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: Colors.grey)),
          child: Text(
            "남은재고 출력.",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _notetext() {
    return Flexible(
        // flex 사용한 위젯씌우고
        flex: 1, // flex 사용
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          height: 120,
          child: Text(
            "비고",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _note() {
    return Flexible(
        flex: 3,
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10),
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: Colors.grey)),
          height: 120,
          child: Text(
            "비고란.",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _cancelButton() {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 20, bottom: 30),
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "취소",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }

  Widget _okButton() {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 30),
          padding: EdgeInsets.all(5),
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "저장",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
