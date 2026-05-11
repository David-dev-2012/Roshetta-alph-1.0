
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/height_manager.dart';
import '../resources/radius_manager.dart';
import '../resources/width_manager.dart';


class DoctorDetailsCard extends StatelessWidget {
  const DoctorDetailsCard({
    super.key,
    required this.image,
    required this.doctorName,
    required this.doctorAddress,
  });

  final String image;
  final String doctorName;
  final String doctorAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: HeightManager.h135,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorManager.borderGrey, strokeAlign: 1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: WidthManagers.w24,
        vertical: HeightManager.h22,
      ),
      child: Row(
        spacing: WidthManagers.w24,
        children: [
          Container(
            width: WidthManagers.w90,
            height: HeightManager.h90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: TextStyle(
                  color: ColorManager.blackText,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizeManagers.f16,
                ),
              ),
              SizedBox(height: HeightManager.h5),
              Text(
                doctorAddress,
                style: TextStyle(
                  color: ColorManager.hintTextGrey,
                  fontSize: FontSizeManagers.f13,
                ),
              ),
              SizedBox(height: HeightManager.h6),
              Container(
                color: ColorManager.hintTextGrey.withValues(alpha: 0.8),
                height: HeightManager.h1,
                width: WidthManagers.w165,
              ),
              SizedBox(height: HeightManager.h15),
              Row(
                spacing: HeightManager.h20,
                children: [
                  Row(
                    spacing: WidthManagers.w20,
                    children: [
                      Container(
                        width: WidthManagers.w45,
                        height: HeightManager.h20,
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withValues(
                            alpha: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(RadiusValuesManager.r5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "⭐ 4.7",
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSizeManagers.f12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        " 800m away",
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: FontSizeManagers.f12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}