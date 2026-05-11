import 'package:flutter/material.dart';


import '../../../core/resources/height_manager.dart';
import 'list_view_design_of_medicines_in_cart.dart';

class ListViewOfMedicinesCartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const ListViewOfMedicinesCartWidget({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const Center(child: Text('Cart is empty'));
    }
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => SizedBox(height: HeightManager.h15),
      itemBuilder: (context, index) {
        return ListViewDesignOfMedicinesInCart(item: cartItems[index]);
      },
    );
  }
}
