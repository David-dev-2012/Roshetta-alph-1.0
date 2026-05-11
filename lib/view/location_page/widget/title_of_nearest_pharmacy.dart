import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/utils.dart';


class TitleOfNearestPharmacy extends StatelessWidget {
  const TitleOfNearestPharmacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: HorizontalPaddingManager.p16,
        vertical: VerticalPaddingManager.p10,
      ),
      child: Text(
        Utils.nearestPharmacy,
        style: TextStyle(
          fontSize: FontSizeManagers.f16,
          fontWeight: FontWeight.bold,
          color: ColorManager.black,
        ),
      ),
    );
  }
}