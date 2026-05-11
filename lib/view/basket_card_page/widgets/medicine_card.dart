import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/width_manager.dart';


class MedicineCard extends StatelessWidget {
  final String name;
  final String size;
  final String price;

  const MedicineCard(this.name, this.size, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: ColorManager.black12,
          )
        ],
      ),
      child: Row(
        children: [
          /// Image
          Container(
            height: HeightManager.h60,
            width: WidthManagers.w60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(RadiusValuesManager.r10),
            ),
            child: const Icon(Icons.medication),
          ),

          SizedBox(width: WidthManagers.w10),

          /// Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeManagers.f16,
                  ),
                ),
                Text(size),
              ],
            ),
          ),

          /// Price
          Text(
            price,
            style: TextStyle(
              color: ColorManager.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}