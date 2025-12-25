import 'package:flutter/material.dart';

Widget players() {
  return Stack(
    children: [
      Positioned(
        top: 80,
        left: 100,
        child: PlayerSeatImageWidget(
          name: "GangsterX",
          balance: "\$799.21",
          actionText: "Check",
        ),
      ),

      Positioned(
        top: 195,
        left: 80,
        child: PlayerSeatImageWidget(
          name: "Gorilla Level",
          balance: "\$699.45",
          actionText: "Raise",
        ),
      ),

      Positioned(
        bottom: 70,
        left: 250,
        child: PlayerSeatImageWidget(
          name: "WickShar",
          balance: "\$566.32",
          actionText: "Call",
        ),
      ),

      Positioned(
        top: 50,
        right: 80,
        child: PlayerSeatImageWidget(
          name: "LoraParis",
          balance: "\$55.32",
          actionText: "Fold",
          positionCoin: true,
        ),
      ),

      Positioned(
        top: 150,
        right: 80,
        child: PlayerSeatImageWidget(
          name: "JohnRael",
          balance: "\$235.32",
          actionText: "Call",
          positionCoin: true,
        ),
      ),
      Positioned(
        bottom: 70,
        right: 300,
        child: PlayerSeatImageWidget(
          name: "XhimasJohn",
          balance: "\$688.32",
          actionText: "Call",   
        ),
      ),
    ],
  );
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
        // Chips
        Positioned(
          top: positionCoin == true ? 0 : -60,
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

        // Cards
        Positioned(
          top: -50,
          child: Image.asset("assets/two_card.png", height: 50),
        ),

        // Call Button
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

        // Bottom Name & Cash Bar
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

        // Avatar
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
