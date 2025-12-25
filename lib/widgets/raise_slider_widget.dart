import 'package:flutter/material.dart';

class RaiseSliderWidget extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double>? onChanged;

  const RaiseSliderWidget({
    super.key,
    this.initialValue = 0.75,
    this.onChanged,
  });

  @override
  State<RaiseSliderWidget> createState() => _RaiseSliderWidgetState();
}

class _RaiseSliderWidgetState extends State<RaiseSliderWidget> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  void _updateValue(double v) {
    setState(() => value = v.clamp(0, 1));
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        timeBadge(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            chip("25%", () => _updateValue(0.25)),
            SizedBox(width: 5),
            chip("50%", () => _updateValue(0.50)),
            SizedBox(width: 5),
            chip("75%", () => _updateValue(0.75)),
            SizedBox(width: 5),
            chip("Max", () => _updateValue(1)),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            circleBtn(Icons.remove, () => _updateValue(value - 0.05)),

            SizedBox(
              width:
                  MediaQuery.of(context).size.width * 0.1, // half screen width
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 4, // thinner slider
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
                ),
                child: Slider(
                  value: value,
                  min: 0,
                  max: 1,
                  activeColor: Colors.cyanAccent,
                  inactiveColor: Colors.white12,
                  onChanged: _updateValue,
                ),
              ),
            ),

            circleBtn(Icons.add, () => _updateValue(value + 0.05)),

            SizedBox(width: 10),

            amountBox(),
          ],
        ),
      ],
    );
  }

  Widget timeBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white30),
      ),
      child: Text(
        "Time (30sec)",
        style: TextStyle(color: Colors.white70, fontSize: 10),
      ),
    );
  }

  Widget chip(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ),
    );
  }

  Widget circleBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white12,
        ),
        child: Icon(icon, color: Colors.white, size: 14),
      ),
    );
  }

  Widget amountBox() {
    return Container(
      width: 40,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        value.toStringAsFixed(2),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }
}
