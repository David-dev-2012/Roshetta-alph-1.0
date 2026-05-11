import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardPointsPage extends StatelessWidget {
  const RewardPointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header - Reward Points Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1ABC9C), Color(0xFF16A085)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 30.h),
              child: Column(
                children: [
                  Icon(Icons.military_tech, color: Colors.white, size: 48.sp),
                  SizedBox(height: 12.h),
                  Text(
                    'Reward Points',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your total balance',
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '1250',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'points',
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ActionButton(icon: Icons.storefront, label: 'Points Store', onTap: () => AppNavigation.pushNamed(context, RoutesName.myOrders)),
                      _ActionButton(icon: Icons.add_circle_outline, label: 'Earn More', onTap: () => AppNavigation.pushNamed(context, RoutesName.myDonations)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Rewards',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF2C3E50)),
                  ),
                  SizedBox(height: 12.h),
                  _RewardCard(icon: Icons.card_giftcard, iconColor: Colors.blue, title: '10% OFF', subtitle: 'Next Purchase', badge: 'Claimed', badgeColor: Colors.grey, points: '500 points', showRedeem: false),
                  _RewardCard(icon: Icons.local_shipping, iconColor: Colors.green, title: 'Free Delivery', subtitle: 'Valid till Dec 31', badge: null, badgeColor: null, points: '300 points', showRedeem: true, redeemColor: Colors.green),
                  _RewardCard(icon: Icons.confirmation_number, iconColor: Colors.orange, title: '\$5 Discount Voucher', subtitle: 'Valid till Dec 31', badge: null, badgeColor: null, points: '750 points', showRedeem: true, redeemColor: Colors.orange),
                  _RewardCard(icon: Icons.headset_mic, iconColor: Colors.purple, title: 'Priority Support', subtitle: '1 Month Access', badge: null, badgeColor: null, points: '1500 points', showRedeem: true, redeemColor: Colors.purple),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF2C3E50)),
                  ),
                  SizedBox(height: 12.h),
                  _ActivityItem(title: 'Donated Paracetamol', date: '2 Days ago', points: '+100', isPositive: true),
                  _ActivityItem(title: 'Redeemed 10% OFF', date: '1 week ago', points: '-500', isPositive: false),
                  _ActivityItem(title: 'Donated Vitamin D', date: '2 weeks ago', points: '+150', isPositive: true),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 26.sp),
            SizedBox(height: 6.h),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 13.sp)),
          ],
        ),
      ),
    );
  }
}

class _RewardCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? badge;
  final Color? badgeColor;
  final String points;
  final bool showRedeem;
  final Color? redeemColor;

  const _RewardCard({required this.icon, required this.iconColor, required this.title, required this.subtitle, required this.badge, required this.badgeColor, required this.points, required this.showRedeem, this.redeemColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(icon, color: iconColor, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF2C3E50))),
                Text(subtitle, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                SizedBox(height: 4.h),
                Text(points, style: TextStyle(fontSize: 12.sp, color: iconColor, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          if (badge != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(color: badgeColor!.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8.r)),
              child: Text(badge!, style: TextStyle(color: badgeColor, fontSize: 12.sp, fontWeight: FontWeight.w600)),
            ),
          if (showRedeem)
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reward redeemed successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: redeemColor,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              child: Text('Redeem', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String title;
  final String date;
  final String points;
  final bool isPositive;
  const _ActivityItem({required this.title, required this.date, required this.points, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: const Color(0xFF2C3E50))),
                Text(date, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
          Text(points, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: isPositive ? Colors.green : Colors.red)),
        ],
      ),
    );
  }
}