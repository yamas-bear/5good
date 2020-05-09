import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calenderHome.dart';
import 'DownBar.dart';
import 'dataListScreen.dart';
import 'package:provider/provider.dart';
import 'dataList.dart';
import 'add_want_list_screen.dart';

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
            backgroundColor: Colors.yellow[300],
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CalenderHome(),
                  SizedBox(height: 20),
                  Text(
                    '今日幸せだったこと、頑張ったことを５個書いてみよう',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Expanded(child: WantList()),
                ],
              ),
            ),
//            bottomNavigationBar: DownBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => AddWantListsScreen());
              },
              child: Icon(
                Icons.add_circle,
                color: Colors.yellow[700],
                size: 45,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
