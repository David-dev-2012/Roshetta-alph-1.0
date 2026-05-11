

import 'package:flutter/material.dart';
import 'package:rosheta_ai/core/navigation/app_navigation.dart';
import 'package:rosheta_ai/core/resources/color_manager.dart';
import 'package:rosheta_ai/core/resources/route_manager.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/utils.dart';
import '../widget/buttom_section.dart';
import '../widget/onboarding_item.dart';
import '../widget/skip_button.dart';

class OnboardingModel {
  final String image;
  final String text;

  OnboardingModel({required this.image, required this.text});
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = OnboardingController();
  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(image: AssetsValuesManager.onBoarding1, text: Utils.onboarding1),
    OnboardingModel(image: AssetsValuesManager.onBoarding2, text: Utils.onboarding2),
    OnboardingModel(image: AssetsValuesManager.onBoarding3, text: Utils.onboarding3),
    OnboardingModel(image: AssetsValuesManager.onBoarding4, text: Utils.onboarding4),
  ];

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [

          SizedBox(height: HeightManager.h40),

          SkipButton(
            onTap: () => controller.skip(context),
          ),

          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final page = pages[index];
                return OnboardingItem(
                  image: page.image,
                  text: page.text,
                );
              },
            ),
          ),

          BottomNavigationSection(
            controller: controller.pageController,
            count: pages.length,
            onNext: () {
              currentIndex <3?
              controller.nextPage(
                context,
                currentIndex,
                pages.length - 1,
              ) : AppNavigation.pushNamed(context, RoutesName.loginIntro);
            },
          ),

           SizedBox(height: HeightManager.h30),
        ],
      ),
    );
  }
}