
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/width_manager.dart';


class RecentDoctor extends StatelessWidget {
  const RecentDoctor({super.key, required this.image, required this.doctor});

  final String image;
  final String doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: WidthManagers.w65,
            height: HeightManager.h65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusValuesManager.r100),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            doctor,
            style: TextStyle(
              color: ColorManager.blackText,
              fontSize: FontSizeManagers.f13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}