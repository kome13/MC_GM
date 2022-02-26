import 'package:flutter/material.dart';
import 'package:mcg_office/src/widget/Inout_widget.dart';
import 'package:mcg_office/src/widget/bottom_widget.dart';

class Inout extends StatelessWidget {
  const Inout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false, // 앱바 뒤로가기버튼 없애기
        title: const Text("계량기 등록"),
        // centerTitle: true,
      ),
      body: InoutWiget(),
      bottomNavigationBar: bottomNavigationBarWidget(),
    );
  }
}
