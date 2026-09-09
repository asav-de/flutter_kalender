import 'package:flutter/material.dart';
import 'package:flutter_kalender/my_box_decoration.dart';
import 'package:intl/intl.dart';

class DayInfo extends StatelessWidget {
  const DayInfo(this.currentDay, {super.key});

  final DateTime currentDay;
  DateTime get currentMonth => DateTime(currentDay.year, currentDay.month);

  String get monthName => DateFormat(
    'MMMM',
    'de_DE',
  ).format(DateTime(currentMonth.year, currentMonth.month));

  String get weekdayName => DateFormat('EEEE', 'de_DE').format(currentDay);

  String get day => currentDay.day.toString();
  String get dayInfoText =>
      'Der ${currentDay.day}. $monthName ${currentDay.year} ist ein $weekdayName und zwar der 1 $weekdayName im Monat $monthName des Jahres ${currentDay.year}. Heute ist kein gesetzlicher Feiertag.';

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 2),
      decoration: MyBoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Kalenderblatt vom ${currentDay.day}. $monthName ${currentDay.year}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: width * 0.03),
            dayInfoText,
          ),
        ],
      ),
    );
  }
}
