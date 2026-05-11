import 'package:flutter/material.dart';

import '../../core/navigation/app_navigation.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/height_manager.dart';
import '../../core/resources/icons_size_manager.dart';
import '../../core/resources/padding_manager.dart';
import '../../core/resources/route_manager.dart';
import '../../core/resources/width_manager.dart';

class CustomNavBarUI extends StatelessWidget {
  const CustomNavBarUI({super.key});

  @override
  Widget build(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name ?? '';
    return Container(
      margin: const EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: VerticalPaddingManager.p8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            isActive: current == RoutesName.home.routeName,
            onTap: () => AppNavigation.pushReplacementNamed(context, RoutesName.home),
          ),
          _NavItem(
            icon: Icons.mail_outline,
            isActive: current == RoutesName.myOrders.routeName,
            onTap: () => AppNavigation.pushNamed(context, RoutesName.myOrders),
          ),
          _NavItem(
            icon: Icons.calendar_today,
            isActive: current == RoutesName.findDoctor.routeName,
            onTap: () => AppNavigation.pushNamed(context, RoutesName.findDoctor),
          ),
          _NavItem(
            icon: Icons.person_outline,
            isActive: current == RoutesName.profile.routeName,
            onTap: () => AppNavigation.pushNamed(context, RoutesName.profile),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? ColorManager.primary : ColorManager.grey,
            size: IconSizeManager.i28,
          ),
          SizedBox(height: HeightManager.h6),
          if (isActive)
            Container(
              width: WidthManagers.w6,
              height: HeightManager.h6,
              decoration: const BoxDecoration(
                color: ColorManager.primary,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
