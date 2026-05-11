import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/const_values_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class MedicalGrid extends StatelessWidget {
  const MedicalGrid({super.key});

  void _showTips(BuildContext context, item) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(RadiusValuesManager.r24)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.fromLTRB(
          WidthManagers.w24,
          VerticalPaddingManager.p20,
          WidthManagers.w24,
          VerticalPaddingManager.p36,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: WidthManagers.w40,
                height: HeightManager.h4,
                decoration: BoxDecoration(
                  color: ColorManager.hintTextGrey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h20),
            Row(
              children: [
                FaIcon(item.icon, color: item.color, size: 24),
                SizedBox(width: WidthManagers.w12),
                Text(
                  '${Utils.tips} — ${item.title}',
                  style: TextStyle(
                    fontSize: FontSizeManagers.f18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.blackText,
                  ),
                ),
              ],
            ),
            SizedBox(height: HeightManager.h20),
            ...item.tips.map<Widget>((tip) => Padding(
              padding: EdgeInsets.only(bottom: HeightManager.h12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: HeightManager.h4),
                    width: WidthManagers.w8,
                    height: HeightManager.h8,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: WidthManagers.w12),
                  Expanded(
                    child: Text(
                      tip,
                      style: TextStyle(
                        fontSize: FontSizeManagers.f14,
                        color: ColorManager.hintTextGrey,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: HeightManager.h200,
      child: GridView.builder(
        itemCount: ConstValueManager.medicalItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = ConstValueManager.medicalItems[index];
          return GestureDetector(
            onTap: () => _showTips(context, item),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: item.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(RadiusValuesManager.r16),
                  ),
                  child: FaIcon(
                    item.icon as FaIconData?,
                    size: 28,
                    color: item.color,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSizeManagers.f12,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.blackText,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}