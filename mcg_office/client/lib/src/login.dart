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
      appBar: AppBar(
        title: Text("Provider sample"),
      ),
      body: LoginWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // 끝부분으로 밀착
        children: [
          IconButton(
            onPressed: () {
              _loginProvider.add();
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _loginProvider.remove();
            },
            icon: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
