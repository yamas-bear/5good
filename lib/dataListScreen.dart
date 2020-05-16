import 'package:flutter/material.dart';
import 'dataList.dart';
import 'package:provider/provider.dart';

class WantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListData>(builder: (context, listdata, index) {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: Provider.of<ListData>(context).wantList.length,
        itemBuilder: (context, index) {
//            final task = listdata.wantList[DateTime.now()][index];
          final task = listdata.wantList[index];
          return Card(
            clipBehavior: Clip.hardEdge,
            child: Column(children: <Widget>[
              ListTile(
                title: Center(child: Text(task)),
                //.toStringはエラーの処理ができたら消去したほうが良いかもしれない
                onLongPress: () {
//                    listdata.deleteList(task);
                },
              ),
            ]),
          );
        },
      );
    });
  }
}
