import 'package:flutter/material.dart';

import '../model/color_card.dart';

final cards = [
  ColorCard(
    title: 'Rides in progress',
    value: '7',
    onTap: () {},
    color: Colors.orange,
  ),
  ColorCard(
    title: 'Packages delivered',
    value: '17',
    onTap: () {},
    color: Colors.lightGreen,
  ),
  ColorCard(
    active: true,
    title: 'Canceled delivered',
    value: '3',
    onTap: () {},
    color: Colors.redAccent,
  ),
  ColorCard(
    title: 'Scheduled deliveries',
    value: '3',
    onTap: () {},
  ),
];
