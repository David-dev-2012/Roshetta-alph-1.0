import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/width_manager.dart';

class LoginOrDividerWidget extends StatelessWidget {
  const LoginOrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: ColorManager.borderGrey),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthManagers.w15),
          child: Text(
            'OR',
            style: TextStyle(
              color: ColorManager.grey,
              fontSize: FontSizeManagers.f14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: ColorManager.borderGrey),
        ),
      ],
    );
  }
}
