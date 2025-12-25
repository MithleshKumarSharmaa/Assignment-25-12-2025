import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget players(Size size) {
  return Stack(
    children: [
      fixedSeat(
        size,
        left: 0.12,
        top: 0.20,
        name: "GangsterX",
        balance: "\$799.21",
        action: "Check",
      ),

      fixedSeat(
        size,
        left: 0.10,
        top: 0.50,
        name: "Gorilla",
        balance: "\$699.45",
        action: "Raise",
      ),

      fixedSeat(
        size,
        left: 0.35,
        top: 0.72,
        name: "JohnRael",
        balance: "\$234.91",
        action: "Call",
      ),

      fixedSeat(
        size,
        left: 0.55,
        top: 0.72,
        name: "WickShar",
        balance: "\$566.32",
        action: "Call",
      ),

      fixedSeat(
        size,
        // left: 0.78,
        // top: 0.30,
        left: 0.77,
        top: 0.50,
        name: "Xhimas",
        balance: "\$688.21",
        action: "Call",
        coin: true,
      ),

      fixedSeat(
        size,
        // left: 0.78,
        // top: 0.50,
        left: 0.75,
        top: 0.20,
        name: "LoraParis",
        balance: "\$55.21",
        action: "Fold",
        coin: true,
      ),
    ],
  );
}

Widget fixedSeat(
  Size size, {
  required double left,
  required double top,
  required String name,
  required String balance,
  required String action,
  bool coin = false,
}) {
  return Positioned(
    left: size.width * left,
    top: size.height * top,
    child: Transform.scale(
      scale: seatScale(size),
      child: PlayerSeatImageWidget(
        name: name,
        balance: balance,
        actionText: action,
        positionCoin: coin,
      ),
    ),
  );
}

double seatScale(Size size) {
  if (size.width < 600) return 0.70;
  if (size.width < 900) return 0.85;
  return 1.0;
}

class PlayerSeatImageWidget extends StatelessWidget {
  final String name;
  final String balance;
  final String? actionText;
  final bool? positionCoin;

  const PlayerSeatImageWidget({
    super.key,
    required this.name,
    required this.balance,
    this.actionText,
    this.positionCoin,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: positionCoin == true ? -60 : -60,
          right: positionCoin == true ? null : -10,
          left: positionCoin == true ? -50 : null,
          child: Column(
            children: [
              Image.asset("assets/coin.png", height: 30),
              const SizedBox(height: 2),
              const Text(
                "1,500",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),

        Positioned(
          top: -50,
          child: Image.asset("assets/two_card.png", height: 50),
        ),

        if (actionText != null)
          Positioned(
            top: -25,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.orange, width: 1.2),
              ),
              child: Text(
                actionText!,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset("assets/name_cash_bar.png", width: 160),
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    balance,
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),

        Positioned(
          left: -10,
          bottom: 0,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: const AssetImage("assets/male_profile.png"),
          ),
        ),
      ],
    );
  }
}
