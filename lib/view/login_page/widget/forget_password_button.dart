import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/route_manager.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => AppNavigation.pushNamed(context, RoutesName.forgetPassword),
        child: Text(
          Utils.forgetPassword,
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: FontSizeManagers.f14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
