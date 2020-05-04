import 'package:flutter/material.dart';

class DownBar extends StatefulWidget {
  @override
  _DownBarState createState() => _DownBarState();
}

class _DownBarState extends State<DownBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('Add'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.face),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _selectedIndex, //現在選択しているアイコンの番号（一番左が0）
      selectedItemColor: Colors.amber[800], //選択しているアイコンの色
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
