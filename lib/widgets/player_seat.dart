import 'package:flutter/material.dart';

Widget playerSeat(String name, String balance) {
  return Column(
    children: [
      const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
      const SizedBox(height: 4),
      Text(name, style: const TextStyle(color: Colors.white)),
      Text(balance, style: const TextStyle(color: Colors.green)),
    ],
  );
}
