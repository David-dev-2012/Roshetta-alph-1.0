import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';



class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h1,
      width: double.infinity,
      color: ColorManager.borderGrey,
    );
  }
}