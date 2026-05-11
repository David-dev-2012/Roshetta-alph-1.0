import 'package:flutter/material.dart';

import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/utils.dart';

class IntroTexts extends StatelessWidget {
  const IntroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Utils.getStarted,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSizeManagers.f20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: HeightManager.h10),
        Text(
          Utils.loginToEnjoy,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSizeManagers.f14,
            height: HeightManager.h1,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}