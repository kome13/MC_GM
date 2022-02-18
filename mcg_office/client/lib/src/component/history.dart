import 'package:flutter/material.dart';
import 'package:mcg_office/src/widget/history_widget.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
      appBar: AppBar(
        automaticallyImplyLeading: false, // 앱바 뒤로가기버튼 없애기
        title: const Text("history"),
        // centerTitle: true,
      ),
      body: HistoryWidget(),
    );
  }
}
