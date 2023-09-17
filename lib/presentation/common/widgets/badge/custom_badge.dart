import 'package:flutter/material.dart';
import 'package:hospital/res/colors.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.textColor,
  });

  final String text;
  final Color color;
  final double size;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Text(text,
            style: TextStyle(
              color: textColor,
              fontSize: size,
            )),
      ),
    );
  }
}
