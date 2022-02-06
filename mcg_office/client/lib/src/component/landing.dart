import 'package:flutter/material.dart';
import 'package:mcg_office/src/component/home.dart';
import 'package:mcg_office/src/component/login.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
        body: Provider.of<Loginbutton>(context).status == false
            ? Login()
            : Home());
  }
}
