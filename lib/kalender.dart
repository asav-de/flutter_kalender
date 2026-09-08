import 'package:flutter/material.dart';

class Kalender extends StatelessWidget {
  const Kalender({super.key});

  @override
  Widget build(context) {
    final now = DateTime.now();
    final int daysOfCurrentMonth = DateTime(now.year, now.month + 1, 0).day;
    final int totalWeeks = (daysOfCurrentMonth / 7).ceil();
    final DateTime firstGridDay = DateTime(
      now.year,
      now.month,
      1,
    ).subtract(Duration(days: DateTime(now.year, now.month, 1).weekday - 1));

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.fromLTRB(12, 0, 12, 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: const Color.fromARGB(255, 207, 252, 61),
        ),
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(144, 0, 0, 0),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        spacing: 8,
        children: [
          for (int week = 0; week < totalWeeks; week++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: createWeek(firstGridDay.add(Duration(days: week * 7))),
            ),
        ],
      ),
    );
  }
}

List<Widget> createWeek(DateTime firstDay) {
  return [
    for (int day = 0; day < 7; day++)
      DayBox(value: firstDay.add(Duration(days: day)).day),
  ];
}

class DayBox extends StatelessWidget {
  const DayBox({super.key, required this.value});

  final int value;

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: 16),
      width: width * 0.12,
      height: height * 0.08,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: const Color.fromARGB(255, 207, 252, 61),
        ),
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(144, 0, 0, 0),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(style: TextStyle(fontSize: width * 0.03), value.toString()),
        ],
      ),
    );
  }
}
