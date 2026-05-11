import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/width_manager.dart';


class MedicineHeaderIcon extends StatelessWidget {
  const MedicineHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h100,
      width: WidthManagers.w100,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: ColorManager.white,
        size: FontSizeManagers.f50,
      ),
    );
  }
}