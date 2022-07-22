import 'package:flutter/material.dart';

import '../../constant/app_cards.dart';
import '../../constant/app_screen_size.dart';
import '../../model/color_card.dart';
import '../../model/menu_type.dart';
import '../view/available_drivers.dart';
import '../view/info_card.dart';
import '../view/info_card_small.dart';
import '../view/revenue_section.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Text(
          MenuType.overview.name.toUpperCase(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (size.width > AppScreenSize.customScreenSize)
          Row(
            children: cards.map((card) {
              return _buildInfoCard(card);
            }).toList(),
          )
        else if (size.width < AppScreenSize.mediumScreenSize)
          ...cards.map((card) => Padding(
                padding: EdgeInsets.only(top: size.height / 64),
                child: InfoCardSmall(card: card),
              ))
        else
          _buildMediumCards(),
        const RevenueSection(),
        const AvailableDrivers(),
      ],
    );
  }

  Widget _buildMediumCards() {
    return Column(
      children: [
        Row(children: [
          _buildInfoCard(cards[0]),
          _buildInfoCard(cards[1]),
        ]),
        Row(children: [
          _buildInfoCard(cards[2]),
          _buildInfoCard(cards[3]),
        ]),
      ],
    );
  }

  Widget _buildInfoCard(ColorCard card) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InfoCard(card: card),
      ),
    );
  }
}
