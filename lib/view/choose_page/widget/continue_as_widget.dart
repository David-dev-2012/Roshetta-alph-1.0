import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/icons_size_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';


class ContinueAsWidget extends StatelessWidget {
  const ContinueAsWidget({
    super.key,
    required this.choice,
    required this.description,
    this.onTap,
    required this.icon,
  });

  final String choice;
  final String description;
  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidthManagers.w320,
      height: 130.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: PaddingManager.p16,
          vertical: PaddingManager.p16,
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: WidthManagers.w100,
                height: HeightManager.h100,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r10),
                ),
                child: Icon(
                  icon,
                  color: ColorManager.white,
                  size: IconSizeManager.i50,
                ),
              ),
              SizedBox(width: WidthManagers.w13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Utils.continueAs,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: FontSizeManagers.f14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: WidthManagers.w5)),
                        TextSpan(
                          text: choice,
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: FontSizeManagers.f14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: HeightManager.h7),
                  Text(
                    description,
                    style: TextStyle(
                      color: ColorManager.grey,
                      fontSize: FontSizeManagers.f10,
                      fontWeight: FontWeight.bold,
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
