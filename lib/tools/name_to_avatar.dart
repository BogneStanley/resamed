import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hospital/res/colors.dart';

// function that takes a first and last name and Build a avatar widget based on the first and last name
Widget buildAvatar(String firstName, String lastName) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.randomColor(),
    ),
    child: Center(
      child: Text(
        firstName[0].toUpperCase() + lastName[0].toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    ),
  );
}
