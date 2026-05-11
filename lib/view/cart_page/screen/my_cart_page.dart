import 'package:flutter/material.dart';

import '../../../core/database/cart_dao.dart';
import '../../../core/database/order_dao.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../view/login_page/widget/success_dialog.dart';
import '../../widget/app_bar_widget.dart';
import '../../widget/normal_title_design.dart';
import '../widgets/list_view_of_medicines_cart_widget.dart';
import '../widgets/payment_details/button_nav_bar_cart_page.dart';
import '../widgets/payment_details/list_veiw_of_payment_details.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> _cartItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  double _calculateTotal() {
    double total = 0;
    for (final item in _cartItems) {
      final price = (item['price'] as num?)?.toDouble() ?? 0;
      final qty = (item['quantity'] as num?)?.toInt() ?? 1;
      total += price * qty;
    }
    return total;
  }

  Future<void> _checkout() async {
    if (_cartItems.isEmpty) return;

    final orderId = await OrderDao.createOrder({
      'orderNumber': '#${DateTime.now().millisecondsSinceEpoch}',
      'total': _calculateTotal(),
      'itemsCount': _cartItems.length,
      'status': 'Pending',
    });

    for (final item in _cartItems) {
      await OrderDao.insertOrderItem({
        'orderId': orderId,
        'name': item['name'],
        'size': item['size'] ?? '',
        'quantity': item['quantity'] ?? 1,
        'price': item['price'],
      });
    }

    await CartDao.clear();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => SuccessDialogWidget(
        titleDialog: Utils.paymentSuccess,
        desc: 'Your order has been placed successfully!',
        buttonTitle: Utils.goToHome,
        route: RoutesName.home,
      ),
    );
  }

  Future<void> _loadCart() async {
    final items = await CartDao.getAll();
    if (!mounted) return;
    setState(() {
      _cartItems = items;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonNavBarCartPage(onCheckout: _checkout),
      backgroundColor: ColorManager.white,
      appBar: AppBarWidget(title: Utils.myCart),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.symmetric(horizontal: HorizontalPaddingManager.p20,vertical: VerticalPaddingManager.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ListViewOfMedicinesCartWidget(cartItems: _cartItems)),
            SizedBox(height: HeightManager.h10),
            NormalTitleDesign(text: Utils.paymentDetails),
            SizedBox(height: HeightManager.h20),
            ListViewOfPaymentDetails(),
            Divider(thickness: 1, color: ColorManager.semiDarkGray),
            SizedBox(height: HeightManager.h10),
            NormalTitleDesign(text: Utils.paymentMethod),
            SizedBox(height: HeightManager.h20,),
            Container(
              height: HeightManager.h61,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
                  border: Border.all(color: ColorManager.semiDarkGray,width: 2)

              ),
              child: Padding(
                padding:EdgeInsetsGeometry.symmetric(horizontal: HorizontalPaddingManager.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Utils.visa,style: TextStyle(color: ColorManager.darkBlue,fontWeight: FontWeight.w800,fontSize: FontSizeManagers.f20),),
                    Text(Utils.change,style: TextStyle(color: ColorManager.grey,fontWeight: FontWeight.bold,fontSize: FontSizeManagers.f16),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
