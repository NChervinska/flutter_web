import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../constant/app_screen_size.dart';
import '../constant/app_strings.dart';
import '../routes/app_routes.dart';
import '../routes/routes.dart';
import '../view/menu_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: _buildTitle(),
        leading:
            MediaQuery.of(context).size.width < AppScreenSize.mediumScreenSize
                ? null
                : _buildLeading(),
      ),
      drawer: Drawer(child: MenuView(navigationKey: navigationKey)),
      body: _buildBody(context),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const Text(AppStrings.appName),
        const Expanded(child: SizedBox.shrink()),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
          color: AppColor.darkBlue,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
          color: AppColor.darkBlue,
        ),
      ],
    );
  }

  Widget _buildLeading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.ac_unit_rounded,
        color: AppColor.blue,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= AppScreenSize.mediumScreenSize) {
      if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
        scaffoldKey.currentState?.closeDrawer();
      }
      return _buildNavigator();
    }

    return Row(
      children: [
        Expanded(child: MenuView(navigationKey: navigationKey)),
        Expanded(
          flex: 5,
          child: _buildNavigator(),
        ),
      ],
    );
  }

  Widget _buildNavigator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navigator(
        key: navigationKey,
        initialRoute: Routes.overviewView,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
