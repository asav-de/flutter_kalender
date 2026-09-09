import 'package:flutter/material.dart';
import 'package:flutter_kalender/info_text.dart';
import 'package:flutter_kalender/kalender.dart';
import 'package:flutter_kalender/month.dart';
import 'package:flutter_kalender/weekdays.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('de_DE');
  runApp(const FlutterCalendar());
}

class FlutterCalendar extends StatefulWidget {
  const FlutterCalendar({super.key});

  @override
  State<FlutterCalendar> createState() => _FlutterCalendarState();
}

class _FlutterCalendarState extends State<FlutterCalendar> {
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime _currentDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void _prevMonth() => setState(
    () => _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1),
  );

  void _nextMonth() => setState(
    () => _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1),
  );

  void _selectDay(DateTime day) => setState(() => _currentDay = day);

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
      home: Scaffold(
        body: Column(
          children: [
            DayInfo(_currentDay),
            Month(
              currentMonth: _currentMonth,
              onPrevMonth: _prevMonth,
              onNextMonth: _nextMonth,
            ),
            WeekDays(),
            Column(
              children: [
                Kalender(
                  currentDay: _currentDay,
                  currentMonth: _currentMonth,
                  onDaySelect: _selectDay,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
