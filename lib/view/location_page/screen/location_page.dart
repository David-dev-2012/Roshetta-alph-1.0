import 'package:flutter/material.dart';
import 'package:rosheta_ai/view/login_page/widget/success_dialog.dart';

import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../widget/app_bar_widget.dart';
import '../../widget/main_button_design.dart';
import '../widget/container_logo_and_address_section.dart';
import '../widget/title_of_nearest_pharmacy.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWidget(title: Utils.nearestPharmacy),
      body: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsValuesManager.locationImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: HorizontalPaddingManager.p20,
            vertical: VerticalPaddingManager.p50,
          ),
          child: Container(
            height: HeightManager.h171,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.overWhite,
              borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TitleOfNearestPharmacy(),

                Divider(thickness: 1, color: ColorManager.semiLightGray),

                // Location Row
                ContainerLogoAndAddressSection(),

                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => SuccessDialogWidget(
                        titleDialog: Utils.success,
                        desc: Utils.desLocation,
                        buttonTitle: Utils.goToHome, route: RoutesName.home,
                      ),
                    );
                  },
                  child: MainButtonDesign(
                    width: double.infinity,
                    text: Utils.confirmLocation,
                    height: HeightManager.h45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
