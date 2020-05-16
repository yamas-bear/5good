import 'package:fivegoodapp/dataListScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//changeNotifierを継承すると変更可能なデータを渡せる
class ListData extends ChangeNotifier {
  //FireStoreのインスタンスを初期化
  Firestore db = Firestore.instance;

//  Map<DateTime, List> wantList = {
//    DateTime.now().subtract(Duration(days: 1)): [],
//    DateTime.now(): [],
//    DateTime.now().add(Duration(days: 1)): []
//  };
//
//  void addTask(String newTaskTitle) {
//    wantList[DateTime.now()] = [newTaskTitle];
//    notifyListeners(); //完了したら通知を送ってデータの更新を行う必要がある。
//  }

  void addTaskTOFireStore(String newTaskTitle) {
    db.collection('users').document('list').setData({'lists': newTaskTitle});
//    db.collection("users").document("list").setData({'lists':newTaskTitle});

    //値が変更されたことを知らせる
    //UIを再構築
    notifyListeners();
  }

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
