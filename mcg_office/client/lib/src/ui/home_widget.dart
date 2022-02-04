import 'package:flutter/material.dart';
import 'package:mcg_office/src/provider/login_provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Text(Provider.of<IdCheckProvider>(context, listen: false)
          .isNotifiable
          .toString()),
    );
  }
}
