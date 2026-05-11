import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/icons_size_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    this.emailController,
    this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordHidden = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.emailController == null) _emailController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          /// ── Email Field ──
          _EmailTextField(controller: _emailController),

          SizedBox(height: HeightManager.h20),

          /// ── Password Field ──
          _PasswordTextField(
            controller: _passwordController,
            isPasswordHidden: _isPasswordHidden,
            onToggle: () {
              setState(() {
                _isPasswordHidden = !_isPasswordHidden;
              });
            },
          ),
        ],
      ),
    );
  }
}

/// ── Email TextField ──────────────────────────────
class _EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const _EmailTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return Utils.pleaseEnterAValidEmailAddress;
        }
        final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$');
        if (!emailRegex.hasMatch(value.trim())) {
          return Utils.pleaseEnterAValidEmailAddress;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.fillColor,
        hintText: Utils.enterEmail,
        hintStyle: TextStyle(
          color: ColorManager.hintTextGrey,
          fontSize: FontSizeManagers.f14,
        ),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: ColorManager.hintTextGrey,
          size: IconSizeManager.i20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: BorderSide(color: ColorManager.borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: BorderSide(color: ColorManager.borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: HeightManager.h15,
        ),
      ),
    );
  }
}

/// ── Password TextField ───────────────────────────
class _PasswordTextField extends StatelessWidget {
  final bool isPasswordHidden;
  final VoidCallback onToggle;
  final TextEditingController controller;

  const _PasswordTextField({
    required this.isPasswordHidden,
    required this.onToggle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordHidden,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return Utils.pleaseEnterAValidPassword;
        }
        final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');
        if (!passwordRegex.hasMatch(value.trim())) {
          return Utils.pleaseEnterAValidPassword;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.fillColor,
        hintText: Utils.enterPassword,
        hintStyle: TextStyle(
          color: ColorManager.hintTextGrey,
          fontSize: FontSizeManagers.f14,
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: ColorManager.hintTextGrey,
          size: IconSizeManager.i20,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordHidden
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: ColorManager.hintTextGrey,
            size: IconSizeManager.i20,
          ),
          onPressed: onToggle,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: BorderSide(color: ColorManager.borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: BorderSide(color: ColorManager.borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: HeightManager.h15,
        ),
      ),
    );
  }
}