import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../model/color_card.dart';

class InfoCardSmall extends StatelessWidget {
  final ColorCard card;

  const InfoCardSmall({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: card.onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 4,
            color: card.active ? AppColor.blue : AppColor.lightGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: _buildRow(),
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          card.title,
          style: TextStyle(
            fontSize: 24,
            color: card.active ? AppColor.blue : AppColor.lightGrey,
          ),
        ),
        Text(
          card.value,
          style: TextStyle(
            fontSize: 24,
            color: card.active ? AppColor.blue : AppColor.lightGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
