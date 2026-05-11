import 'package:flutter/material.dart';

import '../../../core/database/donation_dao.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDonationsPage extends StatefulWidget {
  const MyDonationsPage({super.key});

  @override
  State<MyDonationsPage> createState() => _MyDonationsPageState();
}

class _MyDonationsPageState extends State<MyDonationsPage> {
  List<Map<String, dynamic>> _donations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDonations();
  }

  Future<void> _loadDonations() async {
    final donations = await DonationDao.getAll();
    if (!mounted) return;
    setState(() {
      _donations = donations;
      _isLoading = false;
    });
  }

  int get _total => _donations.length;
  int get _delivered => _donations.where((d) => (d['status'] as String?)?.toLowerCase() == 'delivered').length;
  int get _pending => _donations.where((d) => (d['status'] as String?)?.toLowerCase() == 'pending').length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Donations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          // Stats Row
          Container(
            color: ColorManager.primary,
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(value: '$_total', label: 'Total'),
                _buildDivider(),
                _StatItem(value: '$_delivered', label: 'Delivered'),
                _buildDivider(),
                _StatItem(value: '$_pending', label: 'Pending'),
              ],
            ),
          ),

          // Thank You Banner
          Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.white, size: 28.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thank You for Your Kindness!',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Your donations have helped 11 people access essential medicines.',
                        style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Header Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Donations',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                ),
                TextButton(
                  onPressed: () => AppNavigation.pushNamed(context, RoutesName.pharmacyDashboard),
                  child: Text(
                    '+ Add New',
                    style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),

          // List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _donations.isEmpty
                    ? const Center(child: Text('No donations yet'))
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: _donations.length,
                        itemBuilder: (context, index) => _DonationItem(donation: _donations[index]),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Container(height: 30.h, width: 1, color: Colors.white30);
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
      ],
    );
  }
}

class _DonationItem extends StatelessWidget {
  final Map<String, dynamic> donation;
  const _DonationItem({required this.donation});

  @override
  Widget build(BuildContext context) {
    final name = donation['medicineName'] as String? ?? 'Unknown';
    final quantity = donation['quantity'] as String? ?? '0';
    final date = donation['createdAt'] as String? ?? '';
    final status = donation['status'] as String? ?? 'Pending';
    final statusColor = const Color(0xFFF59E0B);

    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(Icons.medication, color: ColorManager.primary, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: const Color(0xFF1E293B))),
                SizedBox(height: 2.h),
                Text('$quantity • $date', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}