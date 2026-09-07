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
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
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
