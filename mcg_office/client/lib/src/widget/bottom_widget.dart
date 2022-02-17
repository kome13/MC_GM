import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Movie'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Movie2'),
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (index) {},
      ),
    );
  }
}
