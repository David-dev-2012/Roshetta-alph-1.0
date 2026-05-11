import 'package:flutter/material.dart';

import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/width_manager.dart';
import 'address_of_pharmacy_text.dart';
import 'container_of_icon.dart';


class ContainerLogoAndAddressSection extends StatelessWidget {
  const ContainerLogoAndAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: HorizontalPaddingManager.p16,
        vertical: VerticalPaddingManager.p10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Icon
          ContainerOfIcon(),

          SizedBox(width: WidthManagers.w13),

          // Address
          AddressOfPharmacyText(),
        ],
      ),
    );
  }
}