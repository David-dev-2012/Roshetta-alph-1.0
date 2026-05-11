import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/const_values_manager.dart';
import '../../../core/resources/route_manager.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20.sp,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Top Doctor',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black87, size: 24.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        itemCount: ConstValueManager.listTopDoctors.length,
        itemBuilder: (context, index) => DoctorCard(doctor: ConstValueManager.listTopDoctors[index]),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final dynamic doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: () => AppNavigation.pushNamed(context, RoutesName.doctorDetails, args: doctor),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.asset(
                    doctor.doctorImage,
                    width: 88.w,
                    height: 88.h,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => _placeholder(),
                  ),
                ),
                SizedBox(width: 14.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.doctorName,
                        style: TextStyle(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        doctor.doctorSpecialty,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(Icons.star_rounded, color: const Color(0xFF199A8E), size: 17.sp),
                          SizedBox(width: 3.w),
                          Text(
                            doctor.doctorRate,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF199A8E),
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey[400],
                            size: 14.sp,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            doctor.doctorDistanceAway,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
        width: 88.w,
        height: 88.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
      );
}
