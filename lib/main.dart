import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calenderHome.dart';
import 'DownBar.dart';
import 'dataList.dart';

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
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(),
          title: Text('SAMPLE APP'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              calenderHome,
              WantList(),
            ],
          ),
        ),
        bottomNavigationBar: DownBar(),
      ),
    );
  }
}
