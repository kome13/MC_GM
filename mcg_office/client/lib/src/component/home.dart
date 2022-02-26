import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/widget/home_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
      appBar: AppBar(
        automaticallyImplyLeading: false, // 앱바 뒤로가기버튼 없애기
        title: const Text("수불등록"),
        // centerTitle: true,
      ),
      body: HomeWidget(),
    );
  }
}
