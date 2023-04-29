import 'package:flutter/material.dart';

class Coverage {
  String type;
  Map algorithm;
  Map subtype;
  Map profit;
  Color color;

  Coverage({
    required this.type,
    required this.algorithm,
    required this.subtype,
    required this.profit,
    required this.color,
  });
}
