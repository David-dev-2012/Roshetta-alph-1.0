import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';


class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    this.onChangeTap,
  });

  final VoidCallback? onChangeTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: WidthManagers.w20,
        vertical: HeightManager.h15,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(RadiusValuesManager.r14),
        border: Border.all(color: ColorManager.borderGrey),
      ),
      child: Row(
        children: [
          Text(
            Utils.visa,
            style: TextStyle(
              fontSize: FontSizeManagers.f18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF1A1F71),
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onChangeTap,
            child: Text(
              Utils.change,
              style: TextStyle(
                fontSize: FontSizeManagers.f16,
                color: ColorManager.hintTextGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
