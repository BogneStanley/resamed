import 'package:flutter/material.dart';

class XTextEditingController extends TextEditingController {
  dynamic payload;
  XTextEditingController({this.payload, String? text}) : super(text: text);
}
