import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';



class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          padding: EdgeInsets.symmetric(vertical: HeightManager.h10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          ),
        ),
        onPressed: () {
          AppNavigation.pushNamed(context, RoutesName.cart);
        },
        child: Text(
          Utils.addAllToCart,
          style: TextStyle(fontSize: FontSizeManagers.f16),
        ),
      ),
    );
  }
}