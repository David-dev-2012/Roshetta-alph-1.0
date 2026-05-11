import 'package:flutter/material.dart';
import 'package:rosheta_ai/core/navigation/app_navigation.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/radius_manager.dart';
import '../../../../core/resources/width_manager.dart';
import '../../../../model/top_doctors_model.dart';


class ListViewDesignOfTopDoctors extends StatelessWidget {
  const ListViewDesignOfTopDoctors({
    super.key,
    required this.model,
  });

  final TopDoctorsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h240,
      width: WidthManagers.w180,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.semiDarkGray,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: HorizontalPaddingManager.p8,
          vertical: VerticalPaddingManager.p10,
        ),
        child: InkWell(
          onTap:() {
            AppNavigation.pushNamed(context, model.route ,  args: model);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: HeightManager.h40,
                  backgroundImage: AssetImage(model.doctorImage),
                ),
              ),

              SizedBox(height: HeightManager.h20),
              Text(
                model.doctorName,
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManagers.f16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                model.doctorSpecialty,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: FontSizeManagers.f14,
                ),
              ),

              SizedBox(height: HeightManager.h20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: HorizontalPaddingManager.p8,
                      vertical: VerticalPaddingManager.p5,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.backGround2,
                      borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                    ),
                    child: Text(
                      model.doctorRate,
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: FontSizeManagers.f14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    model.doctorDistanceAway,
                    style: TextStyle(
                      color: ColorManager.grey,
                      fontSize: FontSizeManagers.f14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}