import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/session/session_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.r),
                  bottomRight: Radius.circular(32.r),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20.h,
                bottom: 24.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_horiz, color: Colors.white, size: 24.sp),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3.w),
                      color: ColorManager.backGround1,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 48.sp,
                      color: ColorManager.primary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    SessionManager.instance.fullName ?? 'User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatItem(value: '27', label: 'Posts'),
                      Container(width: 1.w, height: 40.h, color: Colors.white30),
                      _StatItem(value: '5', label: 'Saved'),
                      Container(width: 1.w, height: 40.h, color: Colors.white30),
                      _StatItem(value: '2.5km', label: 'km Away'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.shopping_bag_outlined,
                    label: 'My Orders',
                    onTap: () => AppNavigation.pushNamed(context, RoutesName.myOrders),
                  ),
                  Divider(height: 1.h, indent: 20.w, endIndent: 20.w),
                  _MenuItem(
                    icon: Icons.volunteer_activism_outlined,
                    label: 'My Donations',
                    onTap: () => AppNavigation.pushNamed(context, RoutesName.myDonations),
                  ),
                  Divider(height: 1.h, indent: 20.w, endIndent: 20.w),
                  _MenuItem(
                    icon: Icons.military_tech_outlined,
                    label: 'Reward Points',
                    onTap: () => AppNavigation.pushNamed(context, RoutesName.rewards),
                  ),
                  Divider(height: 1.h, indent: 20.w, endIndent: 20.w),
                  _MenuItem(
                    icon: Icons.credit_card_outlined,
                    label: 'Payment Method',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment Method - Coming soon!')),
                    ),
                  ),
                  Divider(height: 1.h, indent: 20.w, endIndent: 20.w),
                  _MenuItem(
                    icon: Icons.help_outline,
                    label: 'FAQs',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('FAQs - Coming soon!')),
                    ),
                  ),
                  Divider(height: 1.h, indent: 20.w, endIndent: 20.w),
                  _MenuItem(
                    icon: Icons.logout,
                    label: 'Log Out',
                    textColor: Colors.red,
                    iconColor: Colors.red,
                    onTap: () => _showLogoutDialog(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: ColorManager.backGround1,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(Icons.logout, color: ColorManager.primary, size: 32.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              'Are you sure to log out of your account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  SessionManager.instance.logout();
                  AppNavigation.pushAndRemoveUntil(context, RoutesName.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.w600, fontSize: 15.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 13.sp),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? iconColor;

  const _MenuItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? ColorManager.primary;
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(icon, color: color, size: 20.sp),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor ?? const Color(0xFF1E293B),
          fontSize: 15.sp,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14.sp,
        color: Colors.grey.shade400,
      ),
    );
  }
}
