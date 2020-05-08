import 'package:flutter/material.dart';

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
}
