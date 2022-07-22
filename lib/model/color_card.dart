import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class ColorCard {
  final String title;
  final String value;
  final Color color;
  final bool active;
  final VoidCallback onTap;

  const ColorCard({
    required this.title,
    required this.value,
    required this.onTap,
    this.active = false,
    this.color = AppColor.blue,
  });
}
