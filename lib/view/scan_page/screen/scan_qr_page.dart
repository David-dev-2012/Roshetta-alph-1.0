import 'package:flutter/material.dart';
import 'package:rosheta_ai/view/widget/app_bar_widget.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(PaddingManager.p20),
          child: Column(
            children: [
              AppBarWidget(title: Utils.scan),
              SizedBox(height: HeightManager.h34),
              Container(
                height: HeightManager.h180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r16),
                  border: Border.all(color: ColorManager.primary),
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 80,
                    color: ColorManager.primary,
                  ),
                ),
              ),
              SizedBox(height: HeightManager.h32),
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: HeightManager.h55,
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(
                      RadiusValuesManager.r20,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt, color: ColorManager.white),
                      SizedBox(width: WidthManagers.w4),
                      Text(
                        Utils.takePhoto,
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: FontSizeManagers.f14,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontsManagers.interMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: HeightManager.h23),
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: HeightManager.h55,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(
                      RadiusValuesManager.r20,
                    ),
                    border: Border.all(color: ColorManager.primary),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload, color: ColorManager.primary),
                      SizedBox(width: WidthManagers.w4),
                      Text(
                        Utils.uploadFromGallery,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: FontSizeManagers.f14,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontsManagers.interMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: HeightManager.h33),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(PaddingManager.p16),
                decoration: BoxDecoration(
                  color: ColorManager.scanColor,
                  borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.tipsForBetterScan,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primary,
                      ),
                    ),
                    SizedBox(height: HeightManager.h8),
                    Text(
                      Utils.ensureGoodLighting,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeManagers.f13,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontsManagers.interMedium,
                      ),
                    ),
                    Text(
                      Utils.keepPrescriptionFlat,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeManagers.f13,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontsManagers.interMedium,
                      ),
                    ),
                    Text(
                      Utils.avoidShadowsAndGlare,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeManagers.f13,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontsManagers.interMedium,
                      ),
                    ),
                    Text(
                      Utils.captureAllTextClearly,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: FontSizeManagers.f13,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontsManagers.interMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
