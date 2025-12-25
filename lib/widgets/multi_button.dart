import 'package:flutter/material.dart';

Widget multiButton(String amount) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.greenAccent, width: 2),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '\$',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
