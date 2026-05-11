import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/utils.dart';

class DescriptionOfMedicine extends StatelessWidget {
  const DescriptionOfMedicine({super.key, required this.desc});

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Utils.description,
          style: TextStyle(
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
            fontSize: FontSizeManagers.f20,
          ),
        ),
        SizedBox(height: HeightManager.h15),
        Text(
          desc,
          style: TextStyle(
            color: ColorManager.grey,
            fontWeight: FontWeight.bold,
            fontSize: FontSizeManagers.f15,
          ),
        ),
      ],
    );
  }
}