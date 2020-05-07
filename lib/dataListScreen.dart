import 'package:flutter/material.dart';
import 'dataList.dart';
import 'package:provider/provider.dart';

class WantList extends StatelessWidget {
  ListData data = ListData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(data.datas[0].toString()),
        Text(data.datas[1].toString()),
        Text(data.datas[2].toString()),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  final String taskTitle;
  TaskTile({this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
      ),
    );
  }
}
