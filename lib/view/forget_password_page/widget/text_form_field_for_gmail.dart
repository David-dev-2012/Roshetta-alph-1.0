import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class TextFormFieldForGmail extends StatelessWidget {
  const TextFormFieldForGmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Utils.enterEmail;
        }
        final emailRegex = RegExp(
            r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$'
        );

        if (!emailRegex.hasMatch(value)) {
          return Utils.pleaseEnterAValidEmailAddress;
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: Utils.emailAddress,
        prefixIcon: const Icon(Icons.email_outlined),
        filled: true,
        fillColor: ColorManager.fillColor,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ColorManager.fillColor,
            width: WidthManagers.w1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: WidthManagers.w2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.red,
            width: WidthManagers.w1_5,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:  BorderSide(
            color: Colors.red,
            width: WidthManagers.w2,
          ),
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}