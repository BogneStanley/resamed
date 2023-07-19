// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RubriqueModel {
  String title;
  String image;
  int bagdeCount;
  VoidCallback? onPressed;
  RubriqueModel({
    required this.title,
    required this.image,
    this.bagdeCount = 0,
    this.onPressed,
  });
}
