import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/routes/routes.dart' show Routers;
import 'package:mcg_office/src/widget/login_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IdCheckProvider()),
      ChangeNotifierProvider(
        create: (BuildContext context) => Loginbutton(),
        child: LoginWidget(),
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
