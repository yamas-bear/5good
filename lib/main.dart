import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';

void main() => runApp(FiveGoods());

class FiveGoods extends StatelessWidget {
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 2));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];
  onSelect(data) {
    print("Selected Date -> $data");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Container(
          child: CalendarStrip(
            startDate: startDate,
            endDate: endDate,
            onDateSelected: onSelect,
            markedDates: markedDates,
          ),
        ),
      ),
    );
  }
}
