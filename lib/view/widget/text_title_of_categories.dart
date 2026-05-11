import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/resources/fonts_manager.dart';
import '../../core/resources/utils.dart';


class TextTitleOfCategories extends StatelessWidget {
  const TextTitleOfCategories({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
            fontSize: FontSizeManagers.f16,
          ),
        ),
        InkWell(
          onTap: () {
            //todo to category page
          },
          child: Text(
            Utils.seeAll,
            style: TextStyle(
                color: ColorManager.primary,
                fontWeight: FontWeight.bold,
                fontSize: FontSizeManagers.f13,
                decoration: TextDecoration.underline
            ),
          ),
        ),
      ],
    );
  }
}