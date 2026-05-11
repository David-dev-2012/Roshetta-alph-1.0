import 'package:flutter/material.dart';


import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/resources/width_manager.dart';
import '../../../widget/main_button_design.dart';

class ButtonNavBarCartPage extends StatelessWidget {
  final VoidCallback? onCheckout;

  const ButtonNavBarCartPage({
    super.key,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(PaddingManager.p20),
      child: SizedBox(
        height: HeightManager.h61,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(Utils.total,style: TextStyle(color: ColorManager.grey,fontSize: FontSizeManagers.f16,fontWeight: FontWeight.bold),),
                SizedBox(height: HeightManager.h8,),
                Text(Utils.d$26x98,style: TextStyle(color: ColorManager.black,fontWeight: FontWeight.bold,fontSize: FontSizeManagers.f18),)
              ],
            ),
            InkWell(
              onTap: onCheckout,
              child: MainButtonDesign(width: WidthManagers.w252, text: Utils.checkout, height: HeightManager.h50),
            ),
          ],
        ),
      ),
    );
  }
}
