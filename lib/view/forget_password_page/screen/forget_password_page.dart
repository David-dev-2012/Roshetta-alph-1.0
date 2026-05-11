import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../widget/forget_password_text_field.dart';
import '../widget/forget_password_toggle.dart';
import '../widget/reset_password_button.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isEmailSelected = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    AppNavigation.pushNamed(
      context,
      RoutesName.verifiedForgetPassword,
      args: {'email': _emailController.text.trim()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: PaddingManager.p48,
            horizontal: PaddingManager.p24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back Icon
                InkWell(
                  onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: ColorManager.blackText,
                    ),
                ),

                SizedBox(height: HeightManager.h24),

                /// Title
                Text(
                  Utils.forgetYourPassword,
                  style: TextStyle(
                    color: ColorManager.blackText,
                    fontSize: FontSizeManagers.f24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: HeightManager.h8),

                /// Subtitle
                Text(
                  Utils.messageForForgetPassword,
                  style: TextStyle(
                    color: ColorManager.grey2,
                    fontSize: FontSizeManagers.f16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: HeightManager.h24),

                /// Toggle Email / Phone
                ForgetPasswordToggle(
                  isEmailSelected: _isEmailSelected,
                  onToggle: (value) {
                    setState(() {
                      _isEmailSelected = value;
                    });
                  },
                ),

                SizedBox(height: HeightManager.h20),

                /// TextField
                ForgetPasswordTextField(
                  isEmailSelected: _isEmailSelected,
                  emailController: _emailController,
                ),

                SizedBox(height: HeightManager.h32),

                /// Button
                ResetPasswordButton(onPressed: _submit),

                SizedBox(height: HeightManager.h15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

