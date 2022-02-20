import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/bottom_provider.dart';
import 'package:mcg_office/src/widget/bottom_widget.dart';
import 'package:mcg_office/src/widget/history_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/widget/home_widget.dart';
import 'package:mcg_office/src/widget/inventory_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late ButtomNavigationProvider _bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    _bottomNavigationBar =
        Provider.of<ButtomNavigationProvider>(context); //이거맞나?
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

    //업데이
    Widget _navigationBody() {
      switch (_bottomNavigationBar.currentNavigationIndex) {
        case 0:
          // return Navigator.pushNamed(context, 'home'); //수불등록
          return HomeWidget();
          break;
        case 1:
          // return Navigator.pushNamed(context, 'inventory'); //재고현황
          return InventoryWidget();
          break;
        case 2:
          // return Navigator.pushNamed(context, 'history'); //내역조회
          return HistoryWidget();
          break;
      } //case3. 내역조회 추가하기
      return Container();
    }

    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
          appBar: AppBar(
            automaticallyImplyLeading: false, // 앱바 뒤로가기버튼 없애기
            title: const Text("Gauge Management "),
            // centerTitle: true,
          ),
          body: _navigationBody(),
          bottomNavigationBar: bottomNavigationBarWidget(),
        ),
        onWillPop: showExitPopup);
  }
}
