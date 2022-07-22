import 'package:flutter/material.dart';

import '../routes/routes.dart';

enum MenuType { overview, drivers, clients }

extension MenuTypeExt on MenuType {
  IconData getIcon() {
    switch (this) {
      case MenuType.overview:
        return Icons.trending_up;
      case MenuType.clients:
        return Icons.people_alt_outlined;
      case MenuType.drivers:
        return Icons.drive_eta;
    }
  }

  String get routes {
    switch (this) {
      case MenuType.overview:
        return Routes.overviewView;
      case MenuType.clients:
        return Routes.clientsView;
      case MenuType.drivers:
        return Routes.driversView;
    }
  }
}
