import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDate = DateTime.now();
  DateTime focusedDay = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Calender"),
      centerTitle: true,
      backgroundColor: Colors.grey,
    ),
    body: TableCalendar(
      focusedDay: focusedDay,
      firstDay:  DateTime(1990),
      lastDay: DateTime(2050),
      calendarFormat: format,
    onFormatChanged: (CalendarFormat _format){
        setState(() {
          format = _format;
        });
        },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,
      onDaySelected: (DateTime selectDay, DateTime focusDay){
        setState(() {
          selectedDate = selectDay;
          focusedDay = focusDay;
        });
        print(focusDay);
      },
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDate, date);
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
            color: Colors.indigoAccent,
            shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Colors.cyanAccent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        formatButtonShowsNext: false,
        formatButtonDecoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5.0),
        ),
          formatButtonTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}