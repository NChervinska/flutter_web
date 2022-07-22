import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../model/color_card.dart';

class InfoCard extends StatelessWidget {
  final ColorCard card;

  const InfoCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: card.onTap,
      child: Container(
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 6),
              color: AppColor.lightGrey.withOpacity(.5),
              blurRadius: 12,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: _buildColumn(),
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: [
        Container(color: card.color, height: 5),
        const Expanded(child: SizedBox.shrink()),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${card.title}\n',
                style: TextStyle(
                  fontSize: 16,
                  color: card.active ? AppColor.blue : AppColor.lightGrey,
                ),
              ),
              TextSpan(
                text: card.value,
                style: TextStyle(
                  fontSize: 40,
                  color: card.active ? AppColor.blue : AppColor.lightGrey,
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
