import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../constant/app_screen_size.dart';
import '../../model/menu_type.dart';
import '../constant/app_strings.dart';
import 'menu_type_view.dart';

class MenuView extends StatefulWidget {
  final GlobalKey<NavigatorState> navigationKey;

  const MenuView({
    Key? key,
    required this.navigationKey,
  }) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  static MenuType _activeType = MenuType.overview;
  static MenuType? _hoverType;

  void onHover(bool hover, MenuType menuType) {
    setState(() {
      if (hover) {
        _hoverType = menuType;
      }
      _hoverType = null;
    });
  }

  void onTap(MenuType menuType) {
    setState(() {
      _activeType = menuType;
    });
    widget.navigationKey.currentState?.pushNamed(menuType.routes);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColor.lightBlue,
      child: ListView(
        children: [
          if (width < AppScreenSize.mediumScreenSize) _buildTopRow(width),
          const SizedBox(height: 40),
          ...MenuType.values.map((menuType) {
            return MenuTypeView(
              menuType: menuType,
              active: _activeType == menuType,
              hover: _hoverType == menuType,
              onHover: (value) => onHover(value, menuType),
              onTap: () => onTap(menuType),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildTopRow(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.ac_unit_outlined),
        ),
        Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.blue,
          ),
        ),
      ],
    );
  }
}
