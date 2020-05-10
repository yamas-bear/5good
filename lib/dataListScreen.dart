import 'package:flutter/material.dart';
import 'dataList.dart';
import 'package:provider/provider.dart';

class WantList extends StatefulWidget {
  @override
  _WantListState createState() => _WantListState();
}

class _WantListState extends State<WantList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListData>(
      builder: (context, listdata, index) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: Provider.of<ListData>(context).listCount,
          itemBuilder: (context, index) {
            final task = listdata.wantList[index];
            return ListTile(
              title: Center(child: Text(task)),
              onLongPress: () {
                listdata.deleteList(task);
              },
            );
          },
        );
      },
    );
  }
}
