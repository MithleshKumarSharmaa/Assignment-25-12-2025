import 'package:flutter/material.dart';
import 'package:task/widgets/action_buttons.dart';
import 'package:task/widgets/board_cards.dart';
import 'package:task/widgets/multi_button.dart';
import 'package:task/widgets/players.dart';
import 'package:task/widgets/raise_slider_widget.dart';

class PokerScreen extends StatelessWidget {
  const PokerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.85),
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              SizedBox(width: 4),
              Icon(Icons.menu, color: Colors.white, size: 35),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  "NL \$150 – NL Hold’em Poker \$1.00/\$2.00 Ante \$0.20",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.settings, color: Colors.white, size: 30),
              SizedBox(width: 5),
              Icon(Icons.logout_outlined, color: Colors.white, size: 30),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/table.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // this board card display on the table
            boardCards(),
            players(),
            Positioned(
              // left: 16,
              right: 16,
              bottom: 60,
              child: RaiseSliderWidget(
                initialValue: 0.75,
                onChanged: (v) {
                  debugPrint("Raise Amount: $v");
                },
              ),
            ),
            Positioned(
              bottom: 10,
              right: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  actionButton(title: "Fold", color: Colors.redAccent),
                  SizedBox(width: 10),
                  actionButton(title: "Call\n0.5\$", color: Colors.greenAccent),
                  SizedBox(width: 10),
                  actionButton(
                    title: "Raise\n0.75\$",
                    color: Colors.cyanAccent,
                  ),
                ],
              ),
            ),
            // text button on top side
            Positioned(top: 10, left: 10, child: multiButton('105,053')),
            // comment button on bottom side
            Positioned(
              bottom: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
