import 'package:flutter/material.dart';
import 'package:flutter_kalender/my_decoration.dart';

import 'package:intl/intl.dart';

class Month extends StatefulWidget {
  const Month({super.key});

  @override
  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {
  DateTime currentMonth = DateTime(DateTime.now().year, DateTime.now().month);

  void prevMonth() {
    setState(
      () => currentMonth = DateTime(currentMonth.year, currentMonth.month - 1),
    );
  }

  void nextMonth() {
    setState(
      () => currentMonth = DateTime(currentMonth.year, currentMonth.month + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: MyBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: prevMonth,
            tooltip: 'Previous month',
            child: const Icon(Icons.chevron_left),
          ),
          Text(
            DateFormat('MMMM').format(currentMonth),
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          FloatingActionButton(
            onPressed: nextMonth,
            tooltip: 'Next month',
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
