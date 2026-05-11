import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';

class CreatePasswordButton extends StatelessWidget {
  const CreatePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   if (_formKey.currentState!.validate()) {
      //     showDialog(
      //       context: context,
      //       barrierDismissible: false,
      //       // builder: (_) => const SuccessDialog(),
      //     );
      //   }
      // },
      child: Container(
        height: HeightManager.h55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
        ),
        child: Center(
          child: Text(
            Utils.createPassword,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: FontSizeManagers.f16,
              fontWeight: FontWeight.w600,
              fontFamily: FontsManagers.interMedium,
            ),
          ),
        ),
      ),
    );
  }
}