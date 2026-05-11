import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/session/session_manager.dart';


// Profile page for the user account view
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Header section with teal gradient ──────────────────────────
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                bottom: 24,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  // Three-dot menu aligned to the right
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_horiz, color: Colors.white),
                  ),
                  const SizedBox(height: 8),

                  // Avatar circle
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      color: ColorManager.backGround1,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 48,
                      color: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // User name
                  Text(
                    SessionManager.instance.fullName ?? 'User',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Stats row: Posts | Saved | Km Away
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatItem(value: '27', label: 'Posts'),
                      Container(width: 1, height: 40, color: Colors.white30),
                      _StatItem(value: '5', label: 'Saved'),
                      Container(width: 1, height: 40, color: Colors.white30),
                      _StatItem(value: '2.5km', label: 'km Away'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Menu items card ────────────────────────────────────────────
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // My Orders — navigates to orders page
                  _MenuItem(
                    icon: Icons.shopping_bag_outlined,
                    label: 'My Orders',
                    onTap: () => AppNavigation.pushNamed(
                      context,
                      RoutesName.myOrders,
                    ),
                  ),
                  const Divider(height: 1, indent: 20, endIndent: 20),

                  // My Donations — navigates to donation page
                  _MenuItem(
                    icon: Icons.volunteer_activism_outlined,
                    label: 'My Donations',
                    onTap: () => AppNavigation.pushNamed(
                      context,
                      RoutesName.myDonations,
                    ),
                  ),
                  const Divider(height: 1, indent: 20, endIndent: 20),

                  // Reward Points — navigates to rewards page
                  _MenuItem(
                    icon: Icons.military_tech_outlined,
                    label: 'Reward Points',
                    onTap: () => AppNavigation.pushNamed(
                      context,
                      RoutesName.rewards,
                    ),
                  ),
                  const Divider(height: 1, indent: 20, endIndent: 20),

                  // Payment Method
                  _MenuItem(
                    icon: Icons.credit_card_outlined,
                    label: 'Payment Method',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment Method - Coming soon!')),
                    ),
                  ),
                  const Divider(height: 1, indent: 20, endIndent: 20),

                  // FAQs
                  _MenuItem(
                    icon: Icons.help_outline,
                    label: 'FAQs',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('FAQs - Coming soon!')),
                    ),
                  ),
                  const Divider(height: 1, indent: 20, endIndent: 20),

                  // Log Out — shows confirmation dialog before logging out
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

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorManager.backGround1,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.logout, color: ColorManager.primary, size: 32),
            ),
            const SizedBox(height: 16),
            const Text(
              'Are you sure to log out of your account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Helper Widgets ──────────────────────────────────────────────────────────

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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor ?? const Color(0xFF1E293B),
          fontSize: 15,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: Colors.grey.shade400,
      ),
    );
  }
}
