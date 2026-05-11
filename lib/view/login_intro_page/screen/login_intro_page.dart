import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../widget/intro_texts.dart';
import '../widget/logo_widget.dart';
import '../widget/outline_button.dart';
import '../widget/primary_button.dart';


class LoginIntroPage extends StatelessWidget {
  const LoginIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),

            SizedBox(height: HeightManager.h30),

            const IntroTexts(),

            SizedBox(height: HeightManager.h40),

            PrimaryButton(
              text: Utils.login,
              onTap: () {
                AppNavigation.pushNamed(context, RoutesName.login);
              },
            ),

            SizedBox(height: HeightManager.h15),

            OutlineButtonWidget(
              text: Utils.signUp,
              onTap: () {
                AppNavigation.pushNamed(context, RoutesName.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}