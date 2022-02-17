import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/widget/home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('확인'),
              content: Text('앱을 종료 하시겠습니까?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('아니오'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: Text('네'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
          appBar: AppBar(
            automaticallyImplyLeading: false, // 앱바 뒤로가기버튼 없애기
            title: const Text("Main"),
            // centerTitle: true,
          ),
          body: HomeWidget(),
        ),
        onWillPop: showExitPopup);
  }
}
