import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';


class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OutlineButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: HeightManager.h50,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primary),
          borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: ColorManager.primary,
              fontSize: FontSizeManagers.f16,
            ),
          ),
        ),
      ),
    );
  }
}