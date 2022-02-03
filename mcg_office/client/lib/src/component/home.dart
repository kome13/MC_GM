import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/ui/home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
      appBar: AppBar(
        title: const Text("main"),
        // centerTitle: true,
      ),
      body: HomeWidget(),
    );
  }
}
