import 'package:flutter/material.dart';

import '../../../core/database/donation_dao.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class PharmacyDashboardPage extends StatefulWidget {
  const PharmacyDashboardPage({super.key});

  @override
  State<PharmacyDashboardPage> createState() => _PharmacyDashboardPageState();
}

class _PharmacyDashboardPageState extends State<PharmacyDashboardPage> {
  final _nameController = TextEditingController();
  final _qtyController = TextEditingController();
  final _notesController = TextEditingController();
  String _condition = 'Sealed';

  @override
  void dispose() {
    _nameController.dispose();
    _qtyController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitDonation() async {
    final name = _nameController.text.trim();
    final qty = _qtyController.text.trim();
    if (name.isEmpty || qty.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill medicine name and quantity')),
      );
      return;
    }

    await DonationDao.insert({
      'medicineName': name,
      'quantity': qty,
      'status': 'Pending',
    });

    if (!mounted) return;
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(PaddingManager.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: HeightManager.h24,
                    color: ColorManager.blackText,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      Utils.pharmacyDashboard,
                      style: TextStyle(
                        color: ColorManager.blackText,
                        fontSize: FontSizeManagers.f16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: HeightManager.h16),
            Center(
              child: Icon(Icons.favorite,
                  size: HeightManager.h100, color: ColorManager.primary),
            ),
            SizedBox(height: HeightManager.h20),

            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Medicine Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h15),

            TextFormField(
              controller: _qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity Available",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h20),

            Text("Condition",
                style: TextStyle(
                    fontSize: FontSizeManagers.f16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: HeightManager.h10),
            Row(
              children: ['Sealed', 'Opened', 'Partial'].map((c) {
                final selected = _condition == c;
                return Padding(
                  padding: EdgeInsets.only(right: WidthManagers.w10),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: selected,
                    onSelected: (v) => setState(() => _condition = c),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: HeightManager.h20),

            TextFormField(
              controller: _notesController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Additional Notes (Optional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h25),

            SizedBox(
              width: double.infinity,
              height: HeightManager.h50,
              child: ElevatedButton(
                onPressed: _submitDonation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                  ),
                ),
                child: Text('Submit Donation',
                    style: TextStyle(
                        fontSize: FontSizeManagers.f16, color: ColorManager.white)),
              ),
            ),
            SizedBox(height: HeightManager.h20),

            Card(
              child: ListTile(
                leading: Icon(Icons.card_giftcard, color: ColorManager.primary),
                title: Text("Add Medicine"),
                subtitle: Text("Add new medicine to inventory"),
                onTap: () => AppNavigation.pushNamed(context, RoutesName.addMedicine),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
