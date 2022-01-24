import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<LoginProvider>(
        builder: (context, provider, child) {
          return Text(
            Provider.of<LoginProvider>(context).count.toString(),
            style: TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}
