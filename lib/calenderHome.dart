import 'package:fivegoodapp/dataListScreen.dart';
import 'package:flutter/material.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:provider/provider.dart';
import 'dataList.dart';

class CalenderHome extends StatefulWidget {
  //現在の日にちから2日前.色が濃くなる日付の選択
//  DateTime startDate = DateTime.now().subtract(Duration(days: 2));

  @override
  _CalenderHomeState createState() => _CalenderHomeState();
}

class _CalenderHomeState extends State<CalenderHome> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 1));

  DateTime endDate = DateTime.now().add(Duration(days: 1));

  DateTime selectedDate = DateTime.now();

  List<DateTime> markedDates = [];

  ListData listData = ListData();

  onSelect(data) {
//    print(data.year() - data.monts() - data.day());
    print(data.year);
    print(data.month);
    print(data.day);
    setState(() {
      WantList(date: data);
    });

//    Navigator.of(data);
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(monthName,
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
//              color: Color(0xFF9dd3a9),
              color: Colors.white,
              fontStyle: FontStyle.normal)),
      padding: EdgeInsets.only(top: 14, bottom: 7),
    );
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    //直近何日かの色とそうでない色を指定する。
    Color fontColor = isDateOutOfRange ? Colors.grey : Colors.black87;
    //選択しているかどうかで、日付の色を指定する。
    TextStyle normalStyle =
        TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 25, fontWeight: FontWeight.w800, color: Colors.orangeAccent);
    //選択しているかどうかで、曜日の色を指定する。
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    //曜日と日付をリストにしている
//    if (date.day.toString() == DateTime.now().day.toString()) {
//      List<Widget> _children = [
//        Text(dayName, style: dayNameStyle),
//        Text(date.day.toString(), style: selectedStyle),
//      ];
//      return _children;
//    }
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(
        date.day.toString(),
        style: !isSelectedDate ? normalStyle : selectedStyle,
      ),
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white60,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CalendarStrip(
      startDate: startDate,
      endDate: endDate,
      onDateSelected: onSelect,
      markedDates: markedDates,
      containerHeight: 120,
      containerDecoration: BoxDecoration(
        color: Color(0xFFACD0C0),
      ),
      iconColor: Colors.white,
      monthNameWidget: _monthNameWidget,
      dateTileBuilder: dateTileBuilder,
    );
  }
}
