import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/fonts_manager.dart';
import '../../core/resources/height_manager.dart';
import '../../core/resources/padding_manager.dart';
import '../../core/resources/radius_manager.dart';
import '../../core/resources/width_manager.dart';
import 'main_button_design.dart';


class AdvertismentsOfApp extends StatelessWidget {
  const AdvertismentsOfApp({super.key, required this.titleAdvertisment, required this.image, required this.buttonText});
  final String titleAdvertisment;
  final String image;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(
        horizontal: HorizontalPaddingManager.p20,
      ),
      padding: EdgeInsetsGeometry.all(16),
      decoration: BoxDecoration(
        color: ColorManager.lightBlue,
        borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleAdvertisment,style: TextStyle(color: ColorManager.black,fontSize: FontSizeManagers.f18,fontWeight: FontWeight.bold),),
                SizedBox(height: HeightManager.h15,),
                MainButtonDesign(
                  width: MediaQuery.of(context).size.width/2,
                  height: HeightManager.h40,
                  text:buttonText,
                ),
              ],
            ),
          ),
          SizedBox(width: WidthManagers.w5),
          Image.asset(image,height: HeightManager.h150,),
        ],
      ),
    );
  }
}