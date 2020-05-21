import 'package:fivegoodapp/dataListScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//changeNotifierを継承することで状態管理を行えるようになっている
//changeNotifierを継承すると変更可能なデータを渡せる
class ListData extends ChangeNotifier {
//  var date = DateTime;
//  ListData(this.date);

  //FireStoreのインスタンスを初期化
  Firestore db = Firestore.instance;

//  Map<DateTime, List> wantList = {
//    DateTime.now().subtract(Duration(days: 1)): [],
//    DateTime.now(): [],
//    DateTime.now().add(Duration(days: 1)): []
//  };
////
//  void addTask(String newTaskTitle) {
//    wantList[DateTime.now()] = [newTaskTitle];
//    notifyListeners(); //完了したら通知を送ってデータの更新を行う必要がある。
//  }

  void addTaskTOFireStore(String newTaskTitle) async {
    var date = DateTime.now();
    await db
        .collection('users')
        .document('UserID')
        .collection('list')
        .add({'lists': newTaskTitle, 'createdAt': date});
//    db.collection("users").document("list").setData({'lists':newTaskTitle});
//    await wantList.add(getDocument().toString());

    //値が変更されたことを知らせる
    //UIを再構築
    notifyListeners();
  }

//
  List<String> wantList = [];
//  QuerySnapshot snapshot = await getDocument();
//  //QuerySnapshot型をstring型に変更する
//  wantList = [snapshot[''].documentChanges.toString()];

//  getDocument() async {
////    複数のデータを取得する
//    QuerySnapshot snapshot = await db
//        .collection('users')
//        .document('UserID')
//        .collection('list')
////        .where("createdAt", isEqualTo: DateTime.may)
//        .getDocuments();
//
////    List<DocumentSnapshot> documents = snapshot.documents;
////    return snapshot.documents[0]['lists'].data;
//    return snapshot;
//  }
//  getDocument() {
//    var docSnapshot = db
//        .collection("users")
//        .document("UserID")
//        .collection("list")
//        .document("UwwQtY2I2TtSmxL3kUkf")
//        .get();
//
//    return docSnapshot;
//  }

  int get listCount {
    return wantList.length;
  }

  //todo firestoreに保存しているデータに追加できるようにする
  void addTask(String newTaskTitle) {
    wantList.add(newTaskTitle);
    //値が変更されたことを知らせる
    //UIを再構築
    notifyListeners();
  }

  void deleteList(String task) {
    wantList.remove(task);
    notifyListeners();
  }

//  getDocument(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: db
//          .collection("users")
//          .document("UserID")
//          .collection("list")
//          .document("UwwQtY2I2TtSmxL3kUkf")
//          .collection('lists')
//          .snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();
//      },
//    );
//  }
}
