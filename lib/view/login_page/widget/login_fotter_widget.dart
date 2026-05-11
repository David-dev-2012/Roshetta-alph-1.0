import 'package:flutter/material.dart';
import 'package:rosheta_ai/view/login_page/widget/social_login_button_widget.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import 'login_and_divider_widget.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Don't have an account? Sign Up
        _SignUpTextWidget(),

        SizedBox(height: HeightManager.h10),

        /// OR
        const LoginOrDividerWidget(),

        SizedBox(height: HeightManager.h20),

        /// Sign in with Google
        SocialLoginButtonWidget(
          icon: Icons.g_mobiledata_rounded,
          iconColor: Colors.red,
          label: 'Sign in with Google',
          onPressed: () {},
        ),

        SizedBox(height: HeightManager.h15),

        /// Sign in with Apple
        SocialLoginButtonWidget(
          icon: Icons.apple,
          iconColor: ColorManager.black,
          label: 'Sign in with Apple',
          onPressed: () {},
        ),

        SizedBox(height: HeightManager.h15),

        /// Sign in with Facebook
        SocialLoginButtonWidget(
          icon: Icons.facebook,
          iconColor: Colors.blue,
          label: 'Sign in with Facebook',
          onPressed: () {},
        ),

        SizedBox(height: HeightManager.h30),
      ],
    );
  }
}

/// ── Don't have an account? Sign Up ───────────────
class _SignUpTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${Utils.notHaveAnAccount}? ",
          style: TextStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManagers.f14,
          ),
        ),
        GestureDetector(
          onTap: () => AppNavigation.pushNamed(context, RoutesName.signUp),
          child: Text(
            Utils.signUp,
            style: TextStyle(
              color: ColorManager.primary,
              fontSize: FontSizeManagers.f14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
