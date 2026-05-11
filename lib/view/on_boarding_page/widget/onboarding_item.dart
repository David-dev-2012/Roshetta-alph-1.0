import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';


class OnboardingItem extends StatelessWidget {
  final String image;
  final String text;

  const OnboardingItem({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: HeightManager.h220),

         SizedBox(height: HeightManager.h30),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: PaddingManager.p30),
          child: Container(
            padding:  EdgeInsets.symmetric(
              horizontal: PaddingManager.p16,
              vertical: PaddingManager.p14,
            ),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(RadiusValuesManager.r16),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeManagers.f13,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}