import 'package:flutter/material.dart';
import 'dataList.dart';
import 'package:provider/provider.dart';

class WantList extends StatefulWidget {
  @override
  _WantListState createState() => _WantListState();
}

class _WantListState extends State<WantList> {
  ListData data = ListData();
  final List<int> colorCodes = <int>[600, 500, 100, 50];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.listCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50, //リストの要素の高さ
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text(data.wantList[index])),
          );
        });
  }
}
