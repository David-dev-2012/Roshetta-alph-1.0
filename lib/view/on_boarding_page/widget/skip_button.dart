import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/utils.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: PaddingManager.p16),
        child: GestureDetector(
          onTap: onTap,
          child:  Text(
            Utils.skip,
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}