import 'package:flutter/material.dart';

Widget WVerticalDevider({
    Color? color,
    double width = 1,
    double height = 20,
  }) {
    return Container(
      height: height,
      width: width,
      color: color ?? Colors.grey.shade300,
    );
  }