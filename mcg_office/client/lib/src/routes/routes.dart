import 'package:flutter/material.dart';
import 'package:mcg_office/src/component/login.dart';
import 'package:mcg_office/src/component/home.dart';
import 'package:mcg_office/src/component/landing.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => Login());
      case 'home':
        return MaterialPageRoute(builder: (_) => Home());
      case 'landing':
        return MaterialPageRoute(builder: (_) => Landing());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
