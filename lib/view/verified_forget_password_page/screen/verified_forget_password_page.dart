import 'package:flutter/material.dart';
import 'package:rosheta_ai/view/widget/app_bar_widget.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../widget/text_form_field_square_forgetpassword.dart';

class VerifiedForgetPasswordPage extends StatefulWidget {
  const VerifiedForgetPasswordPage({super.key});

  @override
  State<VerifiedForgetPasswordPage> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<VerifiedForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: Utils.verify),
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: PaddingManager.p32,
            horizontal: PaddingManager.p20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               

                SizedBox(height: HeightManager.h24),

                /// Title
                Text(
                  Utils.enterVerificationCode,
                  style: TextStyle(
                    color: ColorManager.blackText,
                    fontSize: FontSizeManagers.f20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: HeightManager.h8),

                /// Subtitle
                Text(
                  Utils.messageForVerifiedForgetPassword,
                  style: TextStyle(
                    color: ColorManager.grey2,
                    fontSize: FontSizeManagers.f15,
                  ),
                ),

                SizedBox(height: HeightManager.h30),

                /// Code Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: WidthManagers.w50,
                      child: TextFormFieldSquareForgetPassword(isError: false),
                    ),
                    SizedBox(width: WidthManagers.w20),
                    SizedBox(
                      width: WidthManagers.w50,
                      child: TextFormFieldSquareForgetPassword(isError: false),
                    ),
                    SizedBox(width: WidthManagers.w20),
                    SizedBox(
                      width: WidthManagers.w50,
                      child: TextFormFieldSquareForgetPassword(isError: false),
                    ),
                    SizedBox(width: WidthManagers.w20),
                    SizedBox(
                      width: WidthManagers.w50,
                      child: TextFormFieldSquareForgetPassword(isError: false),
                    ),
                    SizedBox(width: WidthManagers.w20),
                    SizedBox(
                      width: WidthManagers.w50,
                      child: TextFormFieldSquareForgetPassword(isError: false),
                    ),
                  ],
                ),
                SizedBox(height: HeightManager.h45),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      AppNavigation.pushAndRemoveUntil(
                        context,
                        RoutesName.createNewPassword,
                      );
                    }
                  },
                  child: Container(
                    height: HeightManager.h55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(
                        RadiusValuesManager.r20,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        Utils.verify,
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: FontSizeManagers.f16,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontsManagers.interMedium,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: HeightManager.h20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Utils.sendCodeAgain,
                      style: TextStyle(
                        color: ColorManager.grey2,
                        fontSize: FontSizeManagers.f14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: WidthManagers.w4),
                    Text(
                      Utils.resend,
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: FontSizeManagers.f14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
