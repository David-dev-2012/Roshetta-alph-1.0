import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/icons_size_manager.dart';


class MedicineMlAndFavorite extends StatelessWidget {
  const MedicineMlAndFavorite({
    super.key, required this.mlMedicine,
  });
  final String mlMedicine;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mlMedicine,
          style: TextStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManagers.f18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.favorite_border,color: ColorManager.primary,size: IconSizeManager.i30,)
      ],
    );
  }
}