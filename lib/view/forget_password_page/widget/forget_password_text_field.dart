import 'package:flutter/material.dart';
import 'package:rosheta_ai/view/forget_password_page/widget/text_form_field_for_gmail.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class ForgetPasswordTextField extends StatelessWidget {
  const ForgetPasswordTextField({
    super.key,
    required this.isEmailSelected,
    this.emailController,
  });

  final bool isEmailSelected;
  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    if (isEmailSelected) {
      return TextFormFieldForGmail(controller: emailController);
    }

    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Utils.pleaseEnterYourPhoneNumber;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: Utils.phoneNumber,
        prefixIcon: const Icon(Icons.phone_outlined),
        filled: true,
        fillColor: ColorManager.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r14),
          borderSide: BorderSide(color: ColorManager.fillColor, width: WidthManagers.w1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r14),
          borderSide: BorderSide(color: ColorManager.primary, width: WidthManagers.w2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r14),
          borderSide:  BorderSide(color: Colors.red, width: WidthManagers.w1_5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r14),
          borderSide:  BorderSide(color: Colors.red, width: WidthManagers.w2),
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}
