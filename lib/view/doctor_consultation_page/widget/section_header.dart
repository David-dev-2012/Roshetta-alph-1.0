import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/utils.dart';


class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.showChange = false,
    this.onChangeTap,
  });

  final String title;
  final bool showChange;
  final VoidCallback? onChangeTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: FontSizeManagers.f16,
            fontWeight: FontWeight.w700,
            color: ColorManager.blackText,
          ),
        ),
        if (showChange)
          GestureDetector(
            onTap: onChangeTap,
            child: Text(
              Utils.change,
              style: TextStyle(
                fontSize: FontSizeManagers.f13,
                color: ColorManager.hintTextGrey,
              ),
            ),
          ),
      ],
    );
  }
}