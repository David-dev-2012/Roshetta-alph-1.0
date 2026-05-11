import 'package:flutter/material.dart';

import '../../../core/database/order_dao.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<Map<String, dynamic>> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final orders = await OrderDao.getAll();
    if (!mounted) return;
    setState(() {
      _orders = orders;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        leading: const BackButton(),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _orders.isEmpty
              ? const Center(child: Text('No orders yet'))
              : ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: _orders.length,
                  itemBuilder: (context, index) => _OrderCard(order: _orders[index]),
                ),
    );
  }
}

Color _statusColor(String status) {
  switch (status.toLowerCase()) {
    case 'delivered':
      return const Color(0xFF10B981);
    case 'processing':
      return const Color(0xFFF59E0B);
    case 'cancelled':
      return const Color(0xFFEF4444);
    default:
      return const Color(0xFFF59E0B);
  }
}

class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final status = order['status'] as String? ?? 'Pending';
    final statusColor = _statusColor(status);
    final orderId = order['orderNumber'] as String? ?? '#${order['id']}';
    final amount = order['total'] != null ? '\$${order['total']}' : '\$0.00';
    final itemsCount = order['itemsCount'] as int? ?? 0;
    final date = order['createdAt'] as String? ?? '';

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order $orderId', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF1E293B))),
                    SizedBox(height: 2.h),
                    Text(date, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF94A3B8))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(amount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF1E293B))),
                    SizedBox(height: 2.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(status, style: TextStyle(color: statusColor, fontSize: 11.sp, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.shopping_bag_outlined, size: 14.sp, color: const Color(0xFF94A3B8)),
                SizedBox(width: 4.w),
                Text('$itemsCount Items', style: TextStyle(fontSize: 12.sp, color: const Color(0xFF94A3B8))),
              ],
            ),
            SizedBox(height: 10.h),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => AppNavigation.pushNamed(context, RoutesName.detailsPage),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: ColorManager.primary),
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Text('View Details', style: TextStyle(color: ColorManager.primary, fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}