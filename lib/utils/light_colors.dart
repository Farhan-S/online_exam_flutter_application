import 'package:flutter/material.dart';
class LightColors {
  static List<Color> colors = [
    Colors.blue[50] ?? Colors.blue,    // Provide a fallback color if null
    Colors.green[50] ?? Colors.green, // Provide a fallback color if null
    Colors.yellow[50] ?? Colors.yellow,
    Colors.orange[50] ?? Colors.orange,
    Colors.pink[50] ?? Colors.pink,
    Colors.purple[50] ?? Colors.purple,
    Colors.teal[50] ?? Colors.teal,
    Colors.brown[50] ?? Colors.brown,
    Colors.grey[50] ?? Colors.grey,
  ];
}