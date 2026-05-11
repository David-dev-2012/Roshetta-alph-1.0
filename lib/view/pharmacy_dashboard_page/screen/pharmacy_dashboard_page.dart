import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';


class PharmacyDashboardPage extends StatelessWidget {
  const PharmacyDashboardPage({super.key});

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
                  onTap: () {
                    Navigator.of(context).maybePop();
                  },
                  child: Icon(
                    CupertinoIcons.back,
                    size: 40,
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
            /// Icon at top
            Center(
              child: Icon(Icons.favorite,
                  size: HeightManager.h100,
                  color: ColorManager.primary),
            ),
            SizedBox(height: HeightManager.h20),

            /// Medicine Name
            TextFormField(
              decoration: InputDecoration(
                labelText: "Medicine Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h15),

            /// Quantity Available
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity Available",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h15),

            /// Date
            TextFormField(
              decoration: InputDecoration(
                labelText: "mm/dd/yyyy",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h20),

            /// Condition
            Text("Condition", style: TextStyle(
                fontSize: FontSizeManagers.f16, fontWeight: FontWeight.bold)),
            SizedBox(height: HeightManager.h10),
            Row(
              children: [
                ChoiceChip(label: Text("Sealed"), selected: true),
                SizedBox(width: WidthManagers.w10),
                ChoiceChip(label: Text("Opened"), selected: false),
                SizedBox(width: WidthManagers.w10),
                ChoiceChip(label: Text("Partial"), selected: false),
              ],
            ),
            SizedBox(height: HeightManager.h20),

            /// Notes
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Additional Notes (Optional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h25),

            /// Browse Donated Medicines Card
            Card(
              child: ListTile(
                leading: Icon(Icons.medication, color: ColorManager.primary),
                title: Text("Browse Donated Medicines"),
                subtitle: Text("See medicines available from other donations"),
              ),
            ),
            SizedBox(height: HeightManager.h15),

            /// Earn Efforts Card
            Card(
              child: ListTile(
                leading: Icon(Icons.card_giftcard, color: ColorManager.primary),
                title: Text("Add Medicine"),
                subtitle: Text("Add new medicine to inventory"),
                onTap: () => AppNavigation.pushNamed(context, RoutesName.addMedicine),
              ),
            ),
            SizedBox(height: HeightManager.h25),

            /// Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  Text("200k+", style: TextStyle(
                      fontSize: FontSizeManagers.f18, fontWeight: FontWeight.bold)),
                  Text("Donors"),
                ]),
                Column(children: [
                  Text("8.5k+", style: TextStyle(
                      fontSize: FontSizeManagers.f18, fontWeight: FontWeight.bold)),
                  Text("Medicines"),
                ]),
                Column(children: [
                  Text("10k+", style: TextStyle(
                      fontSize: FontSizeManagers.f18, fontWeight: FontWeight.bold)),
                  Text("Helped"),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
