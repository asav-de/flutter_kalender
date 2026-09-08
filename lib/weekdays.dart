import 'package:flutter/material.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({super.key});

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 4),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So']
            .map((day) => Text(style: TextStyle(fontSize: width * 0.03), day))
            .toList(),
      ),
    );
  }
}
