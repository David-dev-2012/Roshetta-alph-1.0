import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class TextFieldSearchHomePage extends StatelessWidget {
  const TextFieldSearchHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: WidthManagers.w350,
        child: TextField(
          decoration: InputDecoration(
            fillColor: ColorManager.semiLightGray,
            filled: true,
            hintText: Utils.search,
            hintStyle: TextStyle(color: ColorManager.grey),
            prefixIcon: const Icon(Icons.search, color: ColorManager.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.semiDarkGray,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primary, width: 2),
              borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
            ),
            contentPadding:  EdgeInsets.symmetric(
              vertical: VerticalPaddingManager.p15,
              horizontal: HorizontalPaddingManager.p20,
            ),
          ),
        ),
      ),
    );
  }
}