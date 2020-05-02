import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calenderHome.dart';

void main() => runApp(FiveGoods());

class FiveGoods extends StatefulWidget {
  @override
  _FiveGoodsState createState() => _FiveGoodsState();
}

class _FiveGoodsState extends State<FiveGoods> {
  CalenderHome calenderHome = CalenderHome();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: calenderHome,
      ),
    );
  }
}
