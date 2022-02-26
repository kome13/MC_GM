import 'package:flutter/material.dart';
import 'package:mcg_office/src/component/history.dart';
import 'package:mcg_office/src/component/home.dart';
import 'package:mcg_office/src/component/inout.dart';
import 'package:mcg_office/src/component/inventory.dart';
import 'package:mcg_office/src/provider/bottom_provider.dart';
import 'package:mcg_office/src/widget/history_widget.dart';
import 'package:mcg_office/src/widget/home_widget.dart';
import 'package:mcg_office/src/widget/inventory_widget.dart';
import 'package:provider/provider.dart';

class bottomNavigationBarWidget extends StatelessWidget {
  bottomNavigationBarWidget({Key? key}) : super(key: key);
  late ButtomNavigationProvider _bottomNavigationBar;
  //이부분 코드 해석 어려움.

  @override
  Widget build(BuildContext context) {
    _bottomNavigationBar =
        Provider.of<ButtomNavigationProvider>(context, listen: false); //이거맞나?
    print("updatePage");
    return Container(
      child: BottomNavigationBar(
        //bottomNavigationBar 생성
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('수불등록'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('재고현황'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('내역조회'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavigationBar.currentNavigationIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          _bottomNavigationBar.updatePage(index);
          //이거맞나?
          //맞나?
        },
      ),
    );
  }

// switch를 통해서 페이지 변환하는 문구.      -> return을 component로 가야하는거아닌가?

}


//홈부분 , scaffold가 있다.
/* scafold 부분은 다른곳에서 처리 하지 않나?
  @override
  Widget build(BuildContext context) {
    _bottomNavigationBar = Provider.of<ButtomNavigationProvider>(context); // 어디에 갖다 붙여야 하나?
    print("updatePage");
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(), // 했던부분.
      // bottomNavigationBar: Consumer<ButtomNavigationProvider>(  // listen false 일때
      //   builder: (BuildContext context, ButtomNavigationProvider value,
      //       Widget child) {
      //     return _bottomNavigationBarWidget();
      //   },
      // ),
    );
  }

  */