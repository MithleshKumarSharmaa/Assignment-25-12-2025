import 'package:flutter/material.dart';

Widget actionButton({required String title, required Color color}) {
  return Container(
    width: 70,
    height: 35,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: color, width: 1.5),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.5),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
      color: Colors.black.withOpacity(0.2),
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600),
    ),
  );
}
