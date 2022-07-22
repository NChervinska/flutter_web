import 'package:flutter/material.dart';

import '../../model/menu_type.dart';
import '../view/revenue_section.dart';

class ClientsTab extends StatelessWidget {
  const ClientsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          MenuType.clients.name.toUpperCase(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const RevenueSection(),
      ],
    );
  }
}
