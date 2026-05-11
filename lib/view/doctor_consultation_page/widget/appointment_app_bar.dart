import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';



class AppointmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppointmentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorManager.blackText,
          size: WidthManagers.w20,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        Utils.appointment,
        style: TextStyle(
          color: ColorManager.blackText,
          fontSize: FontSizeManagers.f18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}