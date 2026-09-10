import 'package:flutter/material.dart';
import 'package:flutter_kalender/date_calculate.dart';
import 'package:flutter_kalender/my_box_decoration.dart';
import 'package:intl/intl.dart';

class InfoText extends StatelessWidget {
  const InfoText(this.currentDay, this.currentMonth, {super.key});

  final DateTime currentDay;
  final DateTime currentMonth;

  int get numberOfDay => currentDay.day;
  int get numberOfWeek => (numberOfDay + 7 - 1) ~/ 7;
  String get isFeierTag =>
      CalculateDate.isFeierTag(currentMonth, currentDay) ? 'ein' : 'kein';

  String get monthName => DateFormat(
    'MMMM',
    'de_DE',
  ).format(DateTime(currentMonth.year, currentMonth.month));

  String get weekdayName => DateFormat('EEEE', 'de_DE').format(currentDay);

  String get dayInfoText =>
      'Der ${currentDay.day}. $monthName ${currentMonth.year} ist ein $weekdayName und zwar der $numberOfWeek $weekdayName im Monat $monthName des Jahres ${currentMonth.year}. Heute ist $isFeierTag gesetzlicher Feiertag.';

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
            'Kalenderblatt vom ${currentDay.day}. $monthName ${currentMonth.year}',
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
