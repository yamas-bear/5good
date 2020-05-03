import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calenderHome.dart';

const numberOfItems = 5001;
const minItemHeight = 20.0;
const maxItemHeight = 150.0;
const scrollDuration = Duration(seconds: 2);

void main() => runApp(FiveGoods());

class FiveGoods extends StatefulWidget {
  @override
  _FiveGoodsState createState() => _FiveGoodsState();
}

class _FiveGoodsState extends State<FiveGoods> {
  CalenderHome calenderHome = CalenderHome();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              calenderHome,
              Container(
                height: 500,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      EntryItem(data[index]),
                  itemCount: data.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    '今日できたこと、楽しかったこと',
    <Entry>[
      Entry(
        'Section A0',
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    '今日の「ありがとう」',
  ),
  Entry(
    '明日やりたいこと',
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
