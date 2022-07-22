import 'package:flutter/material.dart';

import '../pages/tabs/clients_tabs.dart';
import '../pages/tabs/drivers_tabs.dart';
import '../pages/tabs/overview_tabs.dart';
import 'routes.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.clientsView:
        return _materialRoute(const ClientsTab());
      case Routes.driversView:
        return _materialRoute(const DriversTab());
      case Routes.overviewView:
        return _materialRoute(const OverviewTab());
      default:
        return _materialRoute(const SizedBox.shrink());
    }
  }
}

Route<dynamic> _materialRoute(Widget view) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => view,
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;

      return SlideTransition(
        position: animation.drive(Tween(begin: begin, end: end)),
        child: child,
      );
    },
  );
}
