import 'package:flutter/material.dart';

import '../../model/menu_type.dart';
import '../view/available_drivers.dart';

class DriversTab extends StatelessWidget {
  const DriversTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          MenuType.drivers.name.toUpperCase(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const AvailableDrivers(),
      ],
    );
  }
}
