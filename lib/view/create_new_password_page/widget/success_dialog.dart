import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
      ),
      backgroundColor: Colors.white,
      child: SizedBox(
        height: HeightManager.h300,
        width: WidthManagers.w300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Circle background + check icon زي الصورة
            Container(
              width: WidthManagers.w80,
              height:HeightManager.h80,
              decoration: const BoxDecoration(
                color: Color(0xFFEEF2F5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 44,
                color: ColorManager.primary,
              ),
            ),

             SizedBox(height: HeightManager.h20),

            // Title
            Text(
              Utils.success,
              style: TextStyle(
                fontSize: FontSizeManagers.f20,
                fontWeight: FontWeight.bold,
                color: ColorManager.blackText,
                fontFamily: FontsManagers.interMedium,
              ),
            ),

            SizedBox(height: HeightManager.h8),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: HorizontalPaddingManager.h24),
              child: Text(
                Utils.youHaveSuccessfullyResetYourPassword,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize:FontSizeManagers.f14,
                  color: Colors.black54,
                ),
              ),
            ),

             SizedBox(height: HeightManager.h24),

            // Login Button
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: HorizontalPaddingManager.h24),
              child: SizedBox(
                width: double.infinity,
                height: HeightManager.h48,
                child: ElevatedButton(
                  onPressed: () {
                    AppNavigation.pushNamed(context, RoutesName.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
                    ),
                    elevation: 0,
                  ),
                  child:  Text(
                    Utils.login,
                    style: TextStyle(
                      fontSize: FontSizeManagers.f16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
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