import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color.fromARGB(255, 47, 180, 204);
  static const Color dark = Color.fromARGB(255, 71, 71, 71);
  static const Color iconInactive = Color.fromARGB(255, 179, 179, 179);
  static const Color scaffoldBgColor = Color.fromARGB(255, 247, 248, 255);

  static Color randomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(230) + 25,
      Random().nextInt(230) + 25,
      Random().nextInt(230) + 25,
    );
  }
}
