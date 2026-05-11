import 'package:flutter/material.dart';

import '../../../core/database/donation_dao.dart';
import '../../../core/database/medicine_dao.dart';
import '../../../core/database/order_dao.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacyHomePage extends StatefulWidget {
  const PharmacyHomePage({super.key});

  @override
  State<PharmacyHomePage> createState() => _PharmacyHomePageState();
}

class _PharmacyHomePageState extends State<PharmacyHomePage> {
  int _orderCount = 0;
  int _productCount = 0;
  int _donationCount = 0;
  List<Map<String, dynamic>> _recentOrders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final orders = await OrderDao.getAll();
    final medicines = await MedicineDao.getAll();
    final donations = await DonationDao.getAll();
    if (!mounted) return;
    setState(() {
      _orderCount = orders.length;
      _productCount = medicines.length;
      _donationCount = donations.length;
      _recentOrders = orders.take(3).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: Column(
        children: [
          _PharmacyHeader(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 1.5,
                          children: [
                            _StatCard(
                              icon: Icons.shopping_bag_outlined,
                              value: '$_orderCount',
                              label: 'Orders Today',
                              change: '',
                            ),
                            _StatCard(
                              icon: Icons.inventory_2_outlined,
                              value: '$_productCount',
                              label: 'Total Products',
                              change: '',
                            ),
                            _StatCard(
                              icon: Icons.favorite_border_rounded,
                              value: '$_donationCount',
                              label: 'Donations',
                              change: '',
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        const Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1D2E),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            Expanded(
                              child: _QuickActionButton(
                                icon: Icons.add,
                                label: 'Add Medicine',
                                filled: true,
                                onTap: () => AppNavigation.pushNamed(context, RoutesName.addMedicine),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: _QuickActionButton(
                                icon: Icons.shopping_bag_outlined,
                                label: 'View Orders',
                                filled: false,
                                onTap: () => AppNavigation.pushNamed(context, RoutesName.incomingOrders),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            Expanded(
                              child: _QuickActionButton(
                                icon: Icons.medication_outlined,
                                label: 'Medicines',
                                filled: false,
                                onTap: () => AppNavigation.pushNamed(context, RoutesName.medicinePage),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: _QuickActionButton(
                                icon: Icons.favorite_border_rounded,
                                label: 'Donations',
                                filled: false,
                                onTap: () => AppNavigation.pushNamed(context, RoutesName.myDonations),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Orders',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A1D2E),
                              ),
                            ),
                            TextButton(
                              onPressed: () => AppNavigation.pushNamed(context, RoutesName.incomingOrders),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        if (_recentOrders.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(24),
                            child: Center(child: Text('No orders yet', style: TextStyle(color: Color(0xFF8898B3)))),
                          )
                        else
                          ..._recentOrders.map((order) => Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: _OrderCard(
                                  orderId: 'Order #${order['id']}',
                                  customerName: order['orderNumber'] as String? ?? '#${order['id']}',
                                  itemCount: order['itemsCount'] as int? ?? 0,
                                  amount: '\$${(order['total'] as num?)?.toStringAsFixed(2) ?? '0.00'}',
                                  status: order['status'] as String? ?? 'Pending',
                                  statusColor: _statusColor(order['status'] as String? ?? 'Pending'),
                                ),
                              )),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
      case 'ready':
        return const Color(0xFF10B981);
      case 'processing':
        return ColorManager.primary;
      case 'cancelled':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFFF59E0B);
    }
  }
}

class _PharmacyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorManager.primary, const Color(0xFF448AFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 20,
        right: 20,
        bottom: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
              ),
              SizedBox(height: 8.h),
              const Text(
                'Pharmacy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 4.h),
              const Text(
                'Manage your pharmacy',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.menu_rounded, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String change;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: ColorManager.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: ColorManager.primary, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1D2E),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF8898B3),
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: filled ? ColorManager.primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: filled
                  ? ColorManager.primary.withValues(alpha: 0.3)
                  : ColorManager.primary.withValues(alpha: 0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: filled ? Colors.white : ColorManager.primary,
              size: 26,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                color: filled ? Colors.white : ColorManager.primary,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String orderId;
  final String customerName;
  final int itemCount;
  final String amount;
  final String status;
  final Color statusColor;

  const _OrderCard({
    required this.orderId,
    required this.customerName,
    required this.itemCount,
    required this.amount,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primary.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF1A1D2E),
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                customerName,
                style: const TextStyle(
                  color: Color(0xFF8898B3),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$itemCount items',
              style: const TextStyle(
                color: Color(0xFFB0BEC5),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
