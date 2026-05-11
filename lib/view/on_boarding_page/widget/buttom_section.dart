import 'package:flutter/material.dart';

import '../../../core/resources/padding_manager.dart';
import 'dots_indicator.dart';
import 'next_button.dart';


class BottomNavigationSection extends StatelessWidget {
  final PageController controller;
  final int count;
  final VoidCallback onNext;

  const BottomNavigationSection({
    super.key,
    required this.controller,
    required this.count,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingManager.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotsIndicatorWidget(
            controller: controller,
            count: count,
          ),
          NextButton(onTap: onNext),
        ],
      ),
    );
  }
}