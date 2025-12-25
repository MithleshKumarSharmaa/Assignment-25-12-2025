import 'package:flutter/material.dart';

Widget boardCards() {
  return Positioned(
    top: 100,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        boardCard("A", Colors.red),
        boardCard("4", Colors.red),
        boardCard("K", Colors.black),
        boardCard("10", Colors.black),
        boardCard("5", Colors.red),
      ],
    ),
  );
}

Widget boardCard(String text, Color color) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: 40,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
    ),
  );
}
