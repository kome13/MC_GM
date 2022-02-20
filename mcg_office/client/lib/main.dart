import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/bottom_provider.dart';
import 'package:mcg_office/src/provider/inout_provider.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/routes/routes.dart' show Routers;
import 'package:mcg_office/src/widget/bottom_widget.dart';
import 'package:mcg_office/src/widget/login_widget.dart';
import 'package:provider/provider.dart';

import 'src/widget/inout_widget.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IdCheckProvider()),
      ChangeNotifierProvider(
        create: (BuildContext context) => Loginbutton(),
        child: LoginWidget(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) => InoutProvider(),
        child: InoutWiget(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) => ButtomNavigationProvider(), //이부분 수정함
        child: bottomNavigationBarWidget(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCG_OFFICE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'inout',
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
