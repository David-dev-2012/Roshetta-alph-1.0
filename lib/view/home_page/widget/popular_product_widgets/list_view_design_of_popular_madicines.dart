import 'package:flutter/material.dart';

import '../../../../core/database/cart_dao.dart';
import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/icons_size_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/radius_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/width_manager.dart';
import '../../../../model/popular_products_model.dart';

class ListViewDesignOfPopularMedicines extends StatelessWidget {
  const ListViewDesignOfPopularMedicines({super.key, required this.model});

  final PopularProductsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h230,
      width: WidthManagers.w171,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.semiDarkGray, width: 2),
        borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: HorizontalPaddingManager.p8,
          vertical: VerticalPaddingManager.p5,
        ),
        child: InkWell(
          onTap: () {
            AppNavigation.pushNamed(context, model.route, args: model);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  model.medicineImage,
                  height: HeightManager.h100,
                ),
              ),
              SizedBox(height: HeightManager.h20),
              Text(
                model.medicineName,
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManagers.f16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.medicinePieces,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: FontSizeManagers.f14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: HeightManager.h20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.medicinePrice,
                    style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: FontSizeManagers.f18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await CartDao.addItem({
                        'name': model.medicineName,
                        'size': model.medicinePieces,
                        'price': double.tryParse(model.medicinePrice.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0,
                        'quantity': 1,
                        'image': model.medicineImage,
                      });
                      if (!context.mounted) return;
                      AppNavigation.pushNamed(context, RoutesName.cart);
                    },
                    child: Icon(
                      Icons.add_box_rounded,
                      color: ColorManager.primary,
                      size: IconSizeManager.i25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}