import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: prevMonth,
            tooltip: 'Previous month',
            child: const Icon(Icons.chevron_left),
          ),
          Text(
            DateFormat('MMMM yyyy').format(currentMonth),
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
