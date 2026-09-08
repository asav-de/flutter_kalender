import 'package:flutter/material.dart';
import 'package:flutter_kalender/my_decoration.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({super.key});

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: MyBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So']
            .map((day) => Text(style: TextStyle(fontSize: width * 0.03), day))
            .toList(),
      ),
    );
  }
}
