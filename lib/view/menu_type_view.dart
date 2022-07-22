import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../constant/app_screen_size.dart';
import '../../model/menu_type.dart';

class MenuTypeView extends StatelessWidget {
  final MenuType menuType;
  final VoidCallback onTap;
  final ValueSetter<bool> onHover;
  final bool active;
  final bool hover;

  const MenuTypeView({
    Key? key,
    required this.menuType,
    required this.onTap,
    required this.onHover,
    required this.active,
    required this.hover,
  }) : super(key: key);

  TextStyle _getTextStyle() {
    if (active) {
      return const TextStyle(
        color: AppColor.darkBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
    }

    return TextStyle(
      color: hover ? AppColor.darkBlue : AppColor.lightGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: onTap,
          onHover: onHover,
          child: Row(
            children: [
              _buildDecorationContainer(),
              if (constraints.maxWidth < AppScreenSize.smallScreenSize)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildIcon(),
                      const SizedBox(height: 8),
                      Text(menuType.name.toUpperCase(), style: _getTextStyle()),
                    ],
                  ),
                )
              else ...[
                const SizedBox(width: 20),
                _buildIcon(),
                const SizedBox(width: 20),
                Text(menuType.name.toUpperCase(), style: _getTextStyle()),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildDecorationContainer() {
    return Visibility(
      maintainSize: true,
      maintainState: true,
      maintainAnimation: true,
      visible: hover || active,
      child: Container(
        width: 8,
        height: 40,
        color: AppColor.darkBlue,
      ),
    );
  }

  Widget _buildIcon() {
    if (active) {
      return Icon(
        menuType.getIcon(),
        size: 24,
        color: AppColor.darkBlue,
      );
    }
    return Icon(
      menuType.getIcon(),
      color: hover ? AppColor.darkBlue : AppColor.lightGrey,
    );
  }
}
