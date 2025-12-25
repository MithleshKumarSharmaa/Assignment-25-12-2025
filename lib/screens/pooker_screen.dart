import 'package:flutter/material.dart';
import 'package:task/widgets/board_cards.dart';
import 'package:task/widgets/players.dart';

class PokerScreen extends StatelessWidget {
  const PokerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation != Orientation.landscape) {
            return Center(
              child: Text(
                "Please rotate device to Landscape",
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          return Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/table.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [boardCards(size), players(size)]),
          );
        },
      ),
    );
  }
}
