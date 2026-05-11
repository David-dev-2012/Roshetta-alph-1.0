import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/width_manager.dart';
import '../../../core/resources/padding_manager.dart';

class SuccessDialogWidget extends StatelessWidget {
  const SuccessDialogWidget({super.key, required this.titleDialog, required this.desc, required this.buttonTitle, required this.route});
  final String titleDialog;
  final String desc;
  final String buttonTitle;
  final RoutesName route;

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: ColorManager.white,
      insetPadding: EdgeInsets.symmetric(horizontal: WidthManagers.w24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusValuesManager.r24),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: HorizontalPaddingManager.p24,
          vertical: VerticalPaddingManager.p36,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: WidthManagers.w80,
              height: HeightManager.h80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primary.withValues(alpha: 0.1),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.check,
                color: ColorManager.primary,
                size: WidthManagers.w40,
              ),
            ),

            SizedBox(height: HeightManager.h24),

            /// ── Title ──
            Text(
              titleDialog,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeManagers.f20,
                fontWeight: FontWeight.bold,
                color: ColorManager.blackText,
                fontFamily: FontsManagers.interMedium,
              ),
            ),

            SizedBox(height: HeightManager.h8),

            /// ── Description ──
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeManagers.f14,
                color: ColorManager.hintTextGrey,
                height: 1.5,
              ),
            ),

            SizedBox(height: HeightManager.h24),

            /// ── Button ──
            SizedBox(
              width: double.infinity,
              height: HeightManager.h50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  AppNavigation.pushAndRemoveUntil(context, route);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
                  ),
                ),
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    fontSize: FontSizeManagers.f16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.white,
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
