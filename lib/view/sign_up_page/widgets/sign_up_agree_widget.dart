import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/width_manager.dart';

class SignUpAgreeWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const SignUpAgreeWidget({super.key, required this.onChanged});

  @override
  State<SignUpAgreeWidget> createState() => _SignUpAgreeWidgetState();
}

class _SignUpAgreeWidgetState extends State<SignUpAgreeWidget> {
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ── Checkbox ──
        _AgreeCheckbox(
          isAgree: _isAgree,
          onTap: () {
            setState(() {
              _isAgree = !_isAgree;
            });
            widget.onChanged(_isAgree);
          },
        ),

        SizedBox(width: WidthManagers.w12),

        /// ── Terms Text ──
        const Expanded(child: _AgreeRichText()),
      ],
    );
  }
}

/// ── Checkbox ─────────────────────────────────────
class _AgreeCheckbox extends StatelessWidget {
  final bool isAgree;
  final VoidCallback onTap;

  const _AgreeCheckbox({required this.isAgree, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: WidthManagers.w24,
        height: HeightManager.h24,
        decoration: BoxDecoration(
          color: isAgree ? ColorManager.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusValuesManager.r5),
          border: Border.all(
            color: isAgree ? ColorManager.primary : ColorManager.colorOnBoarding,
          ),
        ),
        child: isAgree
            ? Icon(
          Icons.check,
          color: ColorManager.white,
          size: FontSizeManagers.f16,
        )
            : null,
      ),
    );
  }
}

/// ── Terms RichText ───────────────────────────────
class _AgreeRichText extends StatelessWidget {
  const _AgreeRichText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: FontSizeManagers.f14,
          color: ColorManager.grey,
          height: 1.5,
        ),
        children: [
          const TextSpan(text: 'I agree to the medidoc '),
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(color: ColorManager.primary),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}