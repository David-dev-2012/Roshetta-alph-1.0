import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/const_values_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/width_manager.dart';


class MedicalGrid extends StatelessWidget {
  const MedicalGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: HeightManager.h200,
      child: GridView.builder(
        itemCount: ConstValueManager.medicalItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: WidthManagers.w10,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = ConstValueManager.medicalItems[index];
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: WidthManagers.w15,
                  vertical: HeightManager.h15,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  boxShadow: [BoxShadow(color: ColorManager.fillColor,spreadRadius: 1
                  )],
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r16),
                ),
                child: FaIcon(
                  item.icon as FaIconData?,
                  size: 26,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: HeightManager.h10),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: FontSizeManagers.f12,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.hintTextGrey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}