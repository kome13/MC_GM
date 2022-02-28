import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mcg_office/src/model/userinfo.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/widget/home_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        // 기본 컨테이너 단위로 묶어서
        padding: const EdgeInsets.all(15.0), // 컨테이너 페딩추가.

        child: Column(
          // childe 로 컬럼형태의 위젯배열 올리고
          mainAxisAlignment: MainAxisAlignment.start, // 주축 가운데 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 횡축 가운데 정렬

          children: <Widget>[
            // 컬럼 리스트로 각각의 위젯 출력
            _titleText(), // title 글씨
            _buildIdInput(context), // ID 입력 위젯
            _buildPasswordInput(context), // password 입력 위젯
            _idCheck(), // id 저장 버튼
            _buildSubmitButton(context),
          ],
        ));
  }

  // 타이틀 위젯
  Widget _titleText() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft, // 200의 중간 왼쪽정렬
      width: double.infinity, // 가로 width 100%
      height: 110,
      child: const Text(
        "목포도시가스",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w300, // 타이틀 폰트 굵기 설정.
        ),
      ),
    );
  }

  // id 입력위젯
  Widget _buildIdInput(context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: TextFormField(
        keyboardType: TextInputType.text, // id text형으로 입력받기
        autocorrect: false, //자동완성 끄기.
        autofocus: false, // 자동 초점설정 끄기
        controller: _idController,
        onSaved: (value) => _idController.text = value!.trim(),
        style: const TextStyle(fontSize: 20), //글자입,출력 크기조정
        decoration: InputDecoration(
          filled: true, // 뒷 배경 색채우기
          labelText: 'ID',
          prefixIconConstraints:
              const BoxConstraints(minWidth: 20, maxHeight: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: SvgPicture.asset(
              'lib/assets/images/icons/id.svg',
            ),
          ),
          hintText: '아이디 입력',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }

  //password 입력위젯
  Widget _buildPasswordInput(context) {
    return Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: TextFormField(
          autocorrect: false,
          autofocus: false,
          controller: _passwordController,
          onSaved: (value) => _passwordController.text = value!.trim(),
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            filled: true, // 뒷 배경 색채우기
            labelText: 'PASSWORD',
            prefixIconConstraints:
                const BoxConstraints(minWidth: 20, maxHeight: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: SvgPicture.asset(
                'lib/assets/images/icons/password.svg',
              ),
            ),
            hintText: '비밀번호 입력',
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          ),
          obscureText: true, // 비밀번호 안보이게 처리.
        ));
  }

  //아이디 저장 상태 유무 버튼
  Widget _idCheck() {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      height: 50,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            child: const Text(
              "아이디 저장",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
          ),
          Consumer<IdCheckProvider>(
            // consumer 이용해서 context를 통해서 value 변수로 값을 주고 받는다.
            builder: (context, value, child) => Switch(
                // 변수 value, 적용범위 child
                onChanged: (bool isNoti) {
                  // 매개변수 isNti
                  value.toggleNotification(
                      isNotifiable:
                          isNoti); // provider에 정의된 토글 함수에 변수 isNoti를 대입
                },
                value: value.isNotifiable),
          )
        ],
      ),
    );
  }

  //로그인 버튼 위젯
  Widget _buildSubmitButton(BuildContext context) {
    print("re1");
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            // 블럭 효과보이는 버튼
            onPressed: () {
              //id가 비었을경우
              if (_idController.text.isEmpty) {
                _showDialog(
                  context,
                  'ID를 입력해 주세요',
                );
              }
              //password가 비었을 경우
              else if (_passwordController.text.isEmpty) {
                _showDialog(
                  context,
                  'PASSWORD를 입력해 주세요',
                );
              }
              //입력칸이 전부 입려된 경우. 로그인 함수로 일치, 불일치 실행.
              else {
                context
                    .read<Loginbutton>()
                    .login(_idController.text, _passwordController.text);
              }
              //아직미처리..
              // String errorMessage = '존재하지 않는 회원 정보입니다.';
              // _showDialog(context, errorMessage);
            }, // alert 경고창 모듈 만들어서
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              foregroundColor: MaterialStateProperty.all(
                //모든 상태에따라 아래 색상표기
                Colors.white, // 글자색
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                // 버튼 상태에따라 색상 변경
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey;
                  } else {
                    return Colors.blue;
                  }
                },
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20),
            )));
  }
}

// Widget _movingpage(){
//   return Navigator.pushNamed(context, '')
// }

// 팝업창 함수.
void _showDialog(context, String contents) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        title: new Text("다시 입력해주세요."),
        content: SingleChildScrollView(child: new Text('$contents')),
        actions: <Widget>[
          Container(
            child: new FlatButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );
    },
  );
}
