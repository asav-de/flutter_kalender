import 'package:flutter/material.dart';
import 'package:flutter_kalender/date_calculate.dart';
import 'package:flutter_kalender/my_box_decoration.dart';

class Kalender extends StatelessWidget {
  const Kalender({
    super.key,
    required this.currentDay,
    required this.currentMonth,
    required this.onDaySelect,
  });

  final DateTime currentDay;
  final DateTime currentMonth;
  final void Function(DateTime) onDaySelect;

  @override
  Widget build(context) {
    final now = DateTime.now();
    final int daysOfCurrentMonth = DateTime(
      currentMonth.year,
      currentMonth.month + 1,
      0,
    ).day;
    final int totalWeeks = (daysOfCurrentMonth / 7).ceil();
    final DateTime firstOfMonth = DateTime(
      currentMonth.year,
      currentMonth.month,
      1,
    );
    final DateTime firstGridDay = CalculateDate.addDays(
      firstOfMonth,
      -(firstOfMonth.weekday - 1),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: MyBoxDecoration(),
      child: Column(
        spacing: 8,
        children: [
          for (int week = 0; week < totalWeeks; week++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: createWeek(
                now,
                currentDay,
                CalculateDate.addDays(firstGridDay, week * 7),
                onDaySelect,
              ),
            ),
        ],
      ),
    );
  }
}

List<Widget> createWeek(
  DateTime now,
  DateTime currentDay,
  DateTime firstDay,
  void Function(DateTime) onDaySelect,
) {
  return [
    for (int day = 0; day < 7; day++)
      DayBox(
        value: CalculateDate.addDays(firstDay, day),
        onTap: onDaySelect,
        currentDay: currentDay,
      ),
  ];
}

class DayBox extends StatefulWidget {
  const DayBox({
    super.key,
    required this.value,
    required this.onTap,
    required this.currentDay,
  });

  final DateTime value;
  final void Function(DateTime) onTap;
  final DateTime currentDay;

  @override
  State<DayBox> createState() => _DayBoxState();
}

class _DayBoxState extends State<DayBox> {
  @override
  Widget build(context) {
    final now = DateTime.now();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final bool isToday =
        (now.year == widget.value.year &&
        now.month == widget.value.month &&
        now.day == widget.value.day);

    final bool isWeekEnd =
        (widget.value.weekday == 6 || widget.value.weekday == 7) ? true : false;

    final bool isSelected =
        widget.currentDay.year == widget.value.year &&
        widget.currentDay.month == widget.value.month &&
        widget.currentDay.day == widget.value.day;

    return GestureDetector(
      onTap: () => widget.onTap(widget.value),
      child: Container(
        padding: EdgeInsets.only(top: 16),
        width: width * 0.12,
        height: height * 0.08,
        decoration: MyBoxDecoration(),
        child: Column(
          children: [
            Container(
              width: width * 0.06,
              height: width * 0.06,
              alignment: Alignment.center,
              decoration: isToday || isSelected
                  ? BoxDecoration(shape: BoxShape.circle, color: Colors.blue)
                  : isWeekEnd
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(148, 248, 4, 4),
                    )
                  : null,
              child: Text(
                style: TextStyle(fontSize: width * 0.03),
                widget.value.day.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
