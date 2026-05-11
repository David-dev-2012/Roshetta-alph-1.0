import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';


class AppointmentBottomBar extends StatelessWidget {
  const AppointmentBottomBar({
    super.key,
    required this.total,
    required this.onBookingTap,
  });

  final String total;
  final VoidCallback onBookingTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: WidthManagers.w24,
          vertical: HeightManager.h14,
        ),
        color: ColorManager.white,
        child: Row(
          spacing: WidthManagers.w20,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Utils.total,
                  style: TextStyle(
                    fontSize: FontSizeManagers.f13,
                    color: ColorManager.hintTextGrey,
                  ),
                ),
                SizedBox(height: HeightManager.h5),
                Text(
                  total,
                  style: TextStyle(
                    fontSize: FontSizeManagers.f18,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.blackText,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: HeightManager.h55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: onBookingTap,
                  child: Text(
                    Utils.booking,
                    style: TextStyle(
                      fontSize: FontSizeManagers.f16,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}