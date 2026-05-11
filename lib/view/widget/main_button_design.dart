
import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/fonts_manager.dart';
import '../../core/resources/radius_manager.dart';

class MainButtonDesign extends StatelessWidget {
  const MainButtonDesign({super.key, required this.width, required this.text, required this.height});
  final double width;
  final double height;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(color: ColorManager.primary,borderRadius: BorderRadius.circular(RadiusValuesManager.r15)),
      child: Text(text,style: TextStyle(color: ColorManager.white,fontSize: FontSizeManagers.f15,fontWeight: FontWeight.bold),),
    );
  }
}