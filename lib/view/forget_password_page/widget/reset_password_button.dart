import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';


class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          AppNavigation.pushNamed(
            context,
            RoutesName.verifiedForgetPassword,
          );
        }
      },
      child: Container(
        height: HeightManager.h55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
        ),
        child: Center(
          child: Text(
            Utils.resetPassword,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: FontSizeManagers.f16,
              fontWeight: FontWeight.w600,
              fontFamily: FontsManagers.interMedium,
            ),
          ),
        ),
      ),
    );
  }
}
