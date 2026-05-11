import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/count_controller.dart';
import '../../../core/database/cart_dao.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/icons_size_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/width_manager.dart';
import '../../../model/medicine_cart_model.dart';

class ListViewDesignOfMedicinesInCart extends StatelessWidget {
  final MedicineCartModel? model;
  final Map<String, dynamic>? item;

  const ListViewDesignOfMedicinesInCart({
    super.key,
    this.model,
    this.item,
  });

  String get _name => item?['name'] ?? model?.medicineName ?? '';
  String get _size => item?['size'] ?? model?.medicinePieces ?? '';
  String get _price {
    if (item != null) {
      return '\$${item!['price']?.toStringAsFixed(2) ?? '0.00'}';
    }
    return model?.medicinePrice ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: HeightManager.h112,
      width: WidthManagers.w252,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.semiDarkGray,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(RadiusValuesManager.r15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: HorizontalPaddingManager.p8,
          vertical: VerticalPaddingManager.p8,
        ),
        child: Row(
          children: [
            Icon(Icons.medication, size: HeightManager.h73, color: ColorManager.primary),

            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _name,
                          style: TextStyle(
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                            fontSize: FontSizeManagers.f16,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.delete_outline_rounded,
                        color: ColorManager.grey,
                      ),
                    ],
                  ),

                  Text(
                    _size,
                    style: TextStyle(color: ColorManager.grey,fontWeight: FontWeight.bold,fontSize: FontSizeManagers.f12),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterControl(
                        initialValue: item?['quantity'] ?? 1,
                        iconSize: IconSizeManager.i30,
                        numberSize: FontSizeManagers.f20,
                        onChanged: (value) {
                          final id = item?['id'];
                          if (id != null) {
                            CartDao.updateQuantity(id as int, value);
                          }
                        },
                      ),

                      Text(
                        _price,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeManagers.f18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}