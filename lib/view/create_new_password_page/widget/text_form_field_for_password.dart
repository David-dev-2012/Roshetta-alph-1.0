import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/utils.dart';


class TextFormFieldForPassword extends StatefulWidget {
  const TextFormFieldForPassword({
    super.key,
    this.isConfirmPassword = false,
    this.controller,
    this.passController,
  });

  final bool isConfirmPassword;
  final TextEditingController? controller;
  final TextEditingController? passController;

  @override
  State<TextFormFieldForPassword> createState() =>
      _TextFormFieldForPasswordState();
}

class _TextFormFieldForPasswordState extends State<TextFormFieldForPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Utils.enterPassword;
        }
        if (widget.isConfirmPassword) {
          if (value != widget.passController?.text) {
            return 'Passwords do not match';
          }
        } else if (!RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
        ).hasMatch(value)) {
          return Utils.pleaseEnterAValidPassword;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.isConfirmPassword
            ? Utils.confirmPassword   // ← هنضيف الstring دي في utils
            : Utils.password,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: ColorManager.grey2,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        filled: true,
        fillColor: ColorManager.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ColorManager.fillColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}


