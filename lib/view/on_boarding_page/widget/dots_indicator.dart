import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/width_manager.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final PageController controller;
  final int count;

  const DotsIndicatorWidget({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      effect: ExpandingDotsEffect(
        activeDotColor: ColorManager.primary,
        dotColor: ColorManager.grey,
        dotHeight: HeightManager.h8,
        dotWidth: WidthManagers.w8,
      ),
    );
  }
}