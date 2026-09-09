import 'package:flutter/material.dart';

class MyBoxDecoration extends BoxDecoration {
  const MyBoxDecoration()
    : super(
        border: const Border.fromBorderSide(
          BorderSide(width: 1.0, color: Color.fromARGB(255, 207, 252, 61)),
        ),
        color: const Color(0xFFBBDEFB),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(144, 0, 0, 0),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      );
}
