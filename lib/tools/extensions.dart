import 'package:flutter/material.dart';

extension SizeBoxWithDouble on int {
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
}
