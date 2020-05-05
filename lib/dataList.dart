import 'package:flutter/material.dart';

class WantList extends StatelessWidget {
  const WantList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
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
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section1212',
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    '今日の「ありがとう」',
    <Entry>[
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
      Entry(
        'section01',
      ),
    ],
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
