import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rosheta_ai/core/navigation/app_navigation.dart';
import 'package:rosheta_ai/core/resources/route_manager.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({
    super.key,
    required this.onChatDoctorTap,
  });

  final VoidCallback onChatDoctorTap;

  static Future<void> show(
      BuildContext context, {
        required VoidCallback onChatDoctorTap,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => PaymentSuccessDialog(
        onChatDoctorTap: onChatDoctorTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.white,
      insetPadding: EdgeInsets.symmetric(horizontal: WidthManagers.w24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: WidthManagers.w24,
          vertical: HeightManager.h35,
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
            SizedBox(height: HeightManager.h20),

            Text(
              Utils.paymentSuccess,
              style: TextStyle(
                fontSize: FontSizeManagers.f18,
                fontWeight: FontWeight.w700,
                color: ColorManager.blackText,
              ),
            ),
            SizedBox(height: HeightManager.h12),

            Text(
              Utils.paymentSuccessDes,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizeManagers.f13,
                color: ColorManager.hintTextGrey,
                height: 1.5,
              ),
            ),
            SizedBox(height: HeightManager.h24),

            // ----- زرار الشات -----
            Padding(
              padding: EdgeInsets.symmetric(horizontal: WidthManagers.w20),
              child: SizedBox(
                width: double.infinity,
                height: HeightManager.h50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    AppNavigation.pushReplacementNamed(context, RoutesName.home);
                  },
                  child: Text(
                    Utils.goToHome,
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