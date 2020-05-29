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

  void addTaskTOFireStore(String newTaskTitle) async {
    var date =
        (DateTime.now().year - DateTime.now().month - DateTime.now().day);
    await db
        .collection('users')
        .document('UserID')
        .collection('list')
        .add({'lists': newTaskTitle, 'createdAt': date});

    //値が変更されたことを知らせる
    //UIを再構築
    notifyListeners();
  }

//
  List<String> wantList = [];

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
}
