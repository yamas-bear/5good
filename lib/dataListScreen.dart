import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dataList.dart';
import 'package:provider/provider.dart';

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
            isEqualTo:
                DateTime.now().year - DateTime.now().month - DateTime.now().day,
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
