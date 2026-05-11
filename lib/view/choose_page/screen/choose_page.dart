import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../widget/continue_as_widget.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorManager.backGround1, ColorManager.lightPrimary],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AssetsValuesManager.logo,
                height: HeightManager.h300,
                width: WidthManagers.w255,
              ),
              ContinueAsWidget(
                choice: Utils.user,
                description: Utils.browseAndOrderMedicines,
                icon: Icons.people,
                onTap: () {
                  AppNavigation.pushNamed(context, RoutesName.home);
                },
              ),
              SizedBox(height: HeightManager.h20),
              ContinueAsWidget(
                choice: Utils.pharmacy,
                description: Utils.manageYourPharmacy,
                icon: Icons.apartment,
                onTap: () {
                  AppNavigation.pushNamed(context, RoutesName.pharmacyHome);
          
                  // showModalBottomSheet(
                  //   context: context,
                  //   isDismissible: false,
                  //   builder: (context) => SizedBox(
                  //     width: double.infinity,
                  //     child: Column(
                  //       children: [
                  //         ElevatedButton(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Text("back"),
                  //         ),
                  //         Text("Adsf"),
                  //       ],
                  //     ),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
