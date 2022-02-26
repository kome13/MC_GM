import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcg_office/src/component/home.dart';
import 'package:mcg_office/src/component/inventory.dart';
import 'package:mcg_office/src/component/history.dart';
import 'package:mcg_office/src/provider/bottom_provider.dart';
import 'package:mcg_office/src/widget/bottom_widget.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';

class Back extends StatelessWidget {
  const Back({Key? key}) : super(key: key);

  //NavtigationBar 화면전환

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
                  onPressed: () => SystemNavigator.pop(), // 앱 종료
                  //return true when click on "Yes"
                  child: Text('네'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    Widget _navigationBody() {
      print('print back');
      switch (
          context.watch<ButtomNavigationProvider>().currentNavigationIndex) {
        case 0:
          // return Navigator.pushNamed(context, 'home'); //수불등록
          return Home();
          break;
        case 1:
          // return Navigator.pushNamed(context, 'inventory'); //재고현황
          return Inventory();
          break;
        case 2:
          // return Navigator.pushNamed(context, 'history'); //내역조회
          return History();
          break;
      } //case3. 내역조회 추가하기
      return Container();
    }

    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
          body: _navigationBody(),
          bottomNavigationBar: bottomNavigationBarWidget(),
        ),
        onWillPop: showExitPopup);
  }
}
