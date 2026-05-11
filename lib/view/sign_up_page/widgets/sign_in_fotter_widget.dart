import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigation.pushNamed(context, RoutesName.login),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: FontSizeManagers.f16,
              color: ColorManager.grey,
            ),
            children: [
              TextSpan(text: '${Utils.alreadyHaveAnAccount}? '),
              TextSpan(
                text: Utils.signIn,
                style: TextStyle(
                  color: ColorManager.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}