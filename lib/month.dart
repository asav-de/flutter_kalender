import 'package:flutter/material.dart';
import 'package:flutter_kalender/my_box_decoration.dart';
import 'package:intl/intl.dart';

class Month extends StatelessWidget {
  const Month({
    super.key,
    required this.currentMonth,
    required this.onPrevMonth,
    required this.onNextMonth,
  });

  final DateTime currentMonth;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;

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
            onPressed: onPrevMonth,
            tooltip: 'Previous month',
            child: const Icon(Icons.chevron_left),
          ),
          Text(
            DateFormat('MMMM', 'de_DE').format(currentMonth),
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          FloatingActionButton(
            onPressed: onNextMonth,
            tooltip: 'Next month',
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
