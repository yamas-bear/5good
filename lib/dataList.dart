import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListData extends ChangeNotifier {
  List<String> wantList = [
    'sample1',
    'sample2',
    'sample3',
    'sample4',
  ];

  int get listCount {
    return wantList.length;
  }

  void addTask(String newTaskTitle) {
    wantList.add(newTaskTitle);
    notifyListeners(); //完了したら通知を送ってデータの更新を行う必要がある。
  }
}
