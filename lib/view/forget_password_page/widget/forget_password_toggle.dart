import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';

class ForgetPasswordToggle extends StatelessWidget {
  const ForgetPasswordToggle({
    super.key,
    required this.isEmailSelected,
    required this.onToggle,
  });

  final bool isEmailSelected;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h50,
      decoration: BoxDecoration(
        color: ColorManager.fillColor,
        borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
      ),
      child: Row(
        children: [
          /// Email
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: isEmailSelected
                      ? ColorManager.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: isEmailSelected
                      ? [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )]
                      : [],
                ),
                child: Center(
                  child: Text(
                    Utils.email,
                    style: TextStyle(
                      color: isEmailSelected
                          ? ColorManager.primary
                          : ColorManager.grey2,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizeManagers.f14,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Phone
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: !isEmailSelected
                      ? ColorManager.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: !isEmailSelected
                      ? [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )]
                      : [],
                ),
                child: Center(
                  child: Text(
                    Utils.phone,
                    style: TextStyle(
                      color: !isEmailSelected
                          ? ColorManager.primary
                          : ColorManager.grey2,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizeManagers.f14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
