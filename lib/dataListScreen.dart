import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dataList.dart';
import 'package:provider/provider.dart';

//class WantList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<ListData>(builder: (context, listdata, index) {
//      return ListView.builder(
//        padding: const EdgeInsets.all(8),
//        itemCount: Provider.of<ListData>(context).wantList.length,
//        itemBuilder: (context, index) {
////            final task = listdata.wantList[DateTime.now()][index];
//          var task = listdata.getDocument()[index];
//          return Card(
//            clipBehavior: Clip.hardEdge,
//            child: Column(children: <Widget>[
//              ListTile(
//                title: Center(child: Text(task.toString())),
//                //.toStringはエラーの処理ができたら消去したほうが良いかもしれない
//                onLongPress: () {
////                    listdata.deleteList(task);
//                },
//              ),
//            ]),
//          );
//        },
//      );
//    });
//  }
//}
class WantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection("users")
          .document("UserID")
          .collection("list")
          .where(
            "createdAt",
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return buildListView(context, snapshot.data.documents);
      },
    );
  }

  Widget buildListView(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: snapshot.map((data) => ListItem(context, data)).toList(),
    );
  }

  Widget ListItem(BuildContext context, DocumentSnapshot data) {
    var Listdata = data['lists'].toString();
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(children: <Widget>[
        ListTile(
          title: Center(child: Text(Listdata)),
        ),
      ]),
    );
    //.toStringはエラーの処理ができたら消去したほうが良いかもしれない
  }
}
