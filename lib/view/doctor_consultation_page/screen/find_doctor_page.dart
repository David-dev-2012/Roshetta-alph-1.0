import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../../../core/widget/doctor_details.dart';
import '../../../core/resources/const_values_manager.dart';
import '../widget/medical_grid.dart';

class FindDoctorPage extends StatelessWidget {
  const FindDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.blackText,
            size: WidthManagers.w20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          Utils.findDoctor,
          style: TextStyle(
            color: ColorManager.blackText,
            fontSize: FontSizeManagers.f18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthManagers.w24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: HeightManager.h35),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(RadiusValuesManager.r50),
                      borderSide: BorderSide(
                        color: ColorManager.borderGrey,
                        strokeAlign: 1,
                      ),
                    ),
                    enabled: true,
                    fillColor: ColorManager.fillColor,
                    hintText: Utils.findDoctor,
                    hintStyle: TextStyle(
                      color: ColorManager.hintTextGrey,
                      fontSize: FontSizeManagers.f12,
                    ),
                    prefixIcon: Icon(CupertinoIcons.search, size: 18),
                    prefixIconColor: ColorManager.hintTextGrey,
                  ),
                ),
                SizedBox(height: HeightManager.h30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Utils.category,
                    style: TextStyle(
                      fontSize: FontSizeManagers.f18,
                      color: ColorManager.blackText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                MedicalGrid(),
                SizedBox(height: HeightManager.h25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Utils.recommendedDoctors,
                    style: TextStyle(
                      fontSize: FontSizeManagers.f18,
                      color: ColorManager.blackText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: HeightManager.h10),
                GestureDetector(
                  onTap: () =>
                      AppNavigation.pushNamed(
                        context,
                        RoutesName.doctorDetails,
                        args: ConstValueManager.listTopDoctors.first,
                      ),
                  child: DoctorDetailsCard(
                    doctorAddress: Utils.cardiologist,
                    doctorName: Utils.drMarcusHorizon,
                    image: AssetsValuesManager.doctorMarcusImage,
                  ),
                ),
                SizedBox(height: HeightManager.h40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Utils.yourRecentDoctors,
                    style: TextStyle(
                      fontSize: FontSizeManagers.f18,
                      color: ColorManager.blackText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: HeightManager.h10),
                SizedBox(height: HeightManager.h90,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      final doc = ConstValueManager.listRecentDoctors[index];
                      return GestureDetector(
                        onTap: () => AppNavigation.pushNamed(context, RoutesName.doctorDetails, args: doc),
                        child: SizedBox(
                          height: HeightManager.h90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: WidthManagers.w65,
                                height: HeightManager.h65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(RadiusValuesManager.r100),
                                  image: DecorationImage(
                                    image: AssetImage(doc.doctorImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                doc.doctorName,
                                style: TextStyle(
                                  color: ColorManager.blackText,
                                  fontSize: FontSizeManagers.f13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: WidthManagers.w24,),
                    itemCount: ConstValueManager.listRecentDoctors.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}