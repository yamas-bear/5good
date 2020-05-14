import 'package:fivegoodapp/dataListScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListData extends ChangeNotifier {
  List<String> wantList = [];
  int get listCount {
    return wantList.length;
  }

//  Map<DateTime, List> wantList = {
//    DateTime.now().subtract(Duration(days: 1)): [],
//    DateTime.now(): [],
//    DateTime.now().add(Duration(days: 1)): []
//  };

  //todo firestoreに保存しているデータに追加できるようにする
  void addTask(String newTaskTitle) {
    wantList.add(newTaskTitle);
    notifyListeners(); //完了したら通知を送ってデータの更新を行う必要がある。
  }

  void deleteList(String task) {
    wantList.remove(task);
    notifyListeners();
  }
}
