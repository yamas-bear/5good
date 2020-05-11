import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dataList.dart';

class AddWantListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '今日もお疲れさま',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellow[700],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                print(newText);
                newTaskTitle = newText;
              },
            ),
            FlatButton(
                child: Icon(Icons.create),
                color: Colors.lightGreenAccent,
                onPressed: () {
                  if (newTaskTitle == null) {
                    print('nullですね');
                  }
                  Provider.of<ListData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
