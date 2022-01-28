import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      // provider. consumer로 감싸고
      builder: (context, provider, child) {
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
                _buildIdInput(), // ID 입력 위젯
                _buildPasswordInput(), // password 입력 위젯
                _buildSubmitButton(),
              ],
            ));
      },
    );
  }

  // 타이틀 위젯
  Widget _titleText() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft, // 200의 중간 왼쪽정렬
      width: double.infinity, // 가로 width 100%
      height: 180,
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
  Widget _buildIdInput() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text, // id text형으로 입력받기
        autocorrect: false, //자동완성 끄기.
        autofocus: false, // 자동 초점설정 끄기
        style: const TextStyle(fontSize: 20), //글자입,출력 크기조정
        decoration: InputDecoration(
          labelText: 'ID',
          prefixIconConstraints: BoxConstraints(minWidth: 20, maxHeight: 20),
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
  Widget _buildPasswordInput() {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextFormField(
          autocorrect: false,
          autofocus: false,
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            labelText: 'PASSWORD',
            prefixIconConstraints: BoxConstraints(minWidth: 20, maxHeight: 20),
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

  //fhrmdls 버튼 위젯
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
          // 블럭 효과보이는 버튼
          onPressed: () {},
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
                if (states.contains(MaterialState.disabled)) {
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
          )),
    );
  }
}
