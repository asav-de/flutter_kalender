import 'package:flutter/material.dart';
import 'package:flutter_kalender/kalender_info_text.dart';
import 'package:flutter_kalender/month.dart';

void main() {
  runApp(const FlutterCalendar());
}

class FlutterCalendar extends StatelessWidget {
  const FlutterCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Roboto', fontSize: 16),
          headlineSmall: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(body: Column(children: [DayInfo(), Month()])),
    );
  }
}
