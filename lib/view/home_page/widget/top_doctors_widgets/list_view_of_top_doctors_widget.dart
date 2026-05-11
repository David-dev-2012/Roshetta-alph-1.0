import 'package:flutter/material.dart';

import '../../../../core/resources/const_values_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/width_manager.dart';
import 'list_view_design_of_top_doctors.dart';

class ListViewOfTopDoctorsWidget extends StatelessWidget {
  const ListViewOfTopDoctorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h230,
      child: ListView.separated(
        padding:  EdgeInsetsGeometry.symmetric(
          horizontal: HorizontalPaddingManager.p20,

        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: ConstValueManager.listTopDoctors.length,
        separatorBuilder: (context, index) => SizedBox(width: WidthManagers.w20),
        itemBuilder: (context, index) {
          return ListViewDesignOfTopDoctors(
            model: ConstValueManager.listTopDoctors[index],
          );
        },
      ),
    );
  }
}
