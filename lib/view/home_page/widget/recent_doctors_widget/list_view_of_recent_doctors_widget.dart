import 'package:flutter/material.dart';

import '../../../../core/resources/const_values_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/width_manager.dart';
import 'list_view_design_of_recent_doctors.dart';

class ListViewOfRecentDoctorsWidget extends StatelessWidget {
  const ListViewOfRecentDoctorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h124,
      child: ListView.separated(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: HorizontalPaddingManager.p20,

        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: ConstValueManager.listRecentDoctors.length,
        separatorBuilder: (context, index) => SizedBox(width: WidthManagers.w20),
        itemBuilder: (context, index) {
          return ItemRecentDoctor(
            model: ConstValueManager.listRecentDoctors[index],
          );
        },
      ),
    );
  }
}