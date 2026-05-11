import 'package:flutter/material.dart';

import '../../../core/resources/const_values_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/width_manager.dart';
import 'category_page_design.dart';

class ListViewMainComponents extends StatelessWidget {
  const ListViewMainComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: HorizontalPaddingManager.p20,
        ),
        itemCount: ConstValueManager.listAllCategories.length,
        separatorBuilder: (context, index) => SizedBox(width: WidthManagers.w20),
        itemBuilder: (context, index) {
          return CategoriesBoxDesign(
            model: ConstValueManager.listAllCategories[index],
          );
        },
      ),
    );
  }
}