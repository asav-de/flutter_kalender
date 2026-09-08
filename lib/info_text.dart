import 'package:flutter/material.dart';

class DayInfo extends StatelessWidget {
  const DayInfo({super.key});

  static const dayInfoText =
      'Der 7. September 2026 ist ein Montag und zwar der 1 Montag im Monat September des Jahres 2026. Heute ist kein gesetzlicher Feiertag.';

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 2),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Kalenderblatt vom 7. September 2026',
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
