import 'package:flutter/material.dart';

import '../../core/navigation/app_navigation.dart';
import '../../core/resources/route_manager.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/fonts_manager.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key, required this.title, this.icon,
  });
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      elevation: 0,
      centerTitle: true,

      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontsManagers.interMedium,
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: [
        IconButton(
          icon: Icon(icon,color: ColorManager.black,),
          onPressed: () {
            if (icon != null) {
              AppNavigation.pushNamed(context, RoutesName.cart);
            }
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);}