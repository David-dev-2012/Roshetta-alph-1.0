import 'package:flutter/material.dart';

import '../core/navigation/app_navigation.dart';
import '../core/resources/route_manager.dart';

class OnboardingController {
  final PageController pageController = PageController();

  void nextPage(BuildContext context, int currentIndex, int lastIndex) {
    if (currentIndex == lastIndex) {
      AppNavigation.pushReplacementNamed(context, RoutesName.loginIntro);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void skip(BuildContext context) {
    AppNavigation.pushReplacementNamed(context, RoutesName.loginIntro);
  }
}