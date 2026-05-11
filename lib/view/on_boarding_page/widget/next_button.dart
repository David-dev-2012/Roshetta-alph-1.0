import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(
        backgroundColor: ColorManager.primary,
        child: Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}