import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/width_manager.dart';



class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: WidthManagers.w15,
      children: [
        Container(
          width: WidthManagers.w45,
          height: HeightManager.h45,
          decoration: BoxDecoration(
            color: ColorManager.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: ColorManager.primary,
            size: WidthManagers.w20,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: FontSizeManagers.f16,
              fontWeight: FontWeight.w600,
              color: ColorManager.blackText,
            ),
          ),
        ),
      ],
    );
  }
}