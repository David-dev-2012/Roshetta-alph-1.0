import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../model/payment_details_model.dart';


class DesignOfListViewPaymentDetails extends StatelessWidget {
  const DesignOfListViewPaymentDetails({super.key, required this.model});
final PaymentDetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.titleDetail,style: TextStyle(color: ColorManager.grey,fontWeight: FontWeight.bold,fontSize: FontSizeManagers.f18),),
            Text(model.detail,style: TextStyle(color: ColorManager.primary,fontWeight: FontWeight.bold,fontSize: FontSizeManagers.f18),)
          ],
        )
      ],
    );
  }
}
