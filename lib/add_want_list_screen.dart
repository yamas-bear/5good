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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            Text(
//              '今日もお疲れさま',
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                fontSize: 30,
//                color: Colors.yellow[800],
//              ),
//            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              cursorColor: Colors.yellow[700],
              cursorWidth: 5,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                print(newText);
                newTaskTitle = newText;
              },
            ),
            FlatButton(
                visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                child: Icon(Icons.create),
                color: Colors.lightGreenAccent,
                onPressed: () {
                  //ToDo nullの時の処理をここにかく
                  if (newTaskTitle == null) {
                    print('Nullです');
                    Navigator.pop(context);
                  } else {
                    Provider.of<ListData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
