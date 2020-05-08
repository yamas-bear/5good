import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calenderHome.dart';
import 'DownBar.dart';
import 'dataListScreen.dart';
import 'package:provider/provider.dart';
import 'dataList.dart';

void main() => runApp(FiveGoods());

class FiveGoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: SafeArea(
          child: Scaffold(
//          appBar: PreferredSize(
//            preferredSize: Size.fromHeight(40),
//            child: AppBar(
//              backgroundColor: Colors.orangeAccent[200].withOpacity(0.9),
//              centerTitle: true,
//              iconTheme: IconThemeData(),
//              title: Text('SAMPLE APP'),
//            ),
//          ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CalenderHome(),
                  Expanded(child: WantList()),
                ],
              ),
            ),
            bottomNavigationBar: DownBar(),
          ),
        ),
      ),
    );
  }
}
