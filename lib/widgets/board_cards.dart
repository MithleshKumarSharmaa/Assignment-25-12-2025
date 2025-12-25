import 'package:flutter/material.dart';

Widget boardCards(Size size) {
  return Align(
    alignment: const Alignment(0, -0.25),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        boardCard("A", Colors.red, size),
        boardCard("4", Colors.red, size),
        boardCard("K", Colors.black, size),
        boardCard("10", Colors.black, size),
        boardCard("5", Colors.red, size),
      ],
    ),
  );
}

Widget boardCard(String text, Color color, Size size) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: size.width * 0.004),
    width: size.width * 0.045,
    height: size.height * 0.11,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size.width * 0.022,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
  );
}
