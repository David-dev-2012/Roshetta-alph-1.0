import 'package:flutter/material.dart';


import '../../../../core/resources/const_values_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/width_manager.dart';
import 'design_of_list_view_payment_details.dart';

class ListViewOfPaymentDetails extends StatelessWidget {
  const ListViewOfPaymentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h100,
      child: ListView.separated(
        padding:  EdgeInsetsGeometry.symmetric(
          horizontal: HorizontalPaddingManager.p20,

        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: ConstValueManager.listPaymentDetails.length,
        separatorBuilder: (context, index) => SizedBox(width: WidthManagers.w20),
        itemBuilder: (context, index) {
          return DesignOfListViewPaymentDetails(
            model: ConstValueManager.listPaymentDetails[index],
          );
        },
      ),
    );
  }
}
