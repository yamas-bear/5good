import 'package:flutter/material.dart';
import 'List.dart';

class ListData extends ChangeNotifier {
  List<Want> datas = [
    Want(title: 'sample1'),
    Want(title: 'sample2'),
    Want(title: 'sample3'),
  ];

  int get dataCount {
    return datas.length;
  }
}
