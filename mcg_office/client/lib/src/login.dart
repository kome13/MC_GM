import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:mcg_office/src/ui/login_widget.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  late LoginProvider _loginProvider;
  @override
  Widget build(BuildContext context) {
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드에따라 화면밀림 방지.
      appBar: AppBar(
        title: const Text("Login"),
        // centerTitle: true,
      ),
      body: const LoginWidget(),
    );
  }
}
