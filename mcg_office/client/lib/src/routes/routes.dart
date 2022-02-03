import 'package:flutter/material.dart';
import 'package:mcg_office/src/component/login.dart';
import 'package:mcg_office/src/component/home.dart';

final routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => Login(),
  '/home': (BuildContext context) => Home(),
};
