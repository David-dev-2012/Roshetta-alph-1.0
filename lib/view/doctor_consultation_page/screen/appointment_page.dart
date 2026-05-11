import 'package:flutter/material.dart';
import 'package:rosheta_ai/model/recent_doctors_model.dart';
import 'package:rosheta_ai/model/top_doctors_model.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../../../core/widget/doctor_details.dart';
import '../widget/app_divider.dart';
import '../widget/appointment_app_bar.dart';
import '../widget/appointment_bottom_bar.dart';
import '../widget/info_tile.dart';
import '../widget/payment_method_card.dart';
import '../widget/payment_row.dart';
import '../widget/payment_success_dialog.dart';
import '../widget/section_header.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? image;
    String? doctorName;
    var model = ModalRoute.of(context)?.settings.arguments;
    ////////
    if ( model is RecentDoctorModel){
      image = model.doctorImage;
      doctorName = model.doctorName;
    } else if(model is TopDoctorsModel){
      image = model.doctorImage;
      doctorName = model.doctorName;
    }else{
      //image is null
      image = null;
    }
    if (image ==null ) {
      return Scaffold(body: Center(child: Text("Not found any doctors")));
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: const AppointmentAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: WidthManagers.w24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: HeightManager.h10),

              DoctorDetailsCard(
                image: image,
                doctorName: doctorName!,
                doctorAddress: Utils.doctorCardiologist,
              ),

              SizedBox(height: HeightManager.h24),

              SectionHeader(
                title: Utils.date,
                showChange: true,
                onChangeTap: () {},
              ),
              SizedBox(height: HeightManager.h12),
              InfoTile(
                icon: Icons.calendar_today_outlined,
                text: Utils.wednesday,
              ),
              SizedBox(height: HeightManager.h20),
              const AppDivider(),
              SizedBox(height: HeightManager.h20),

              // ----- Reason -----
              SectionHeader(
                title: Utils.reason,
                showChange: true,
                onChangeTap: () {},
              ),
              SizedBox(height: HeightManager.h12),
              InfoTile(icon: Icons.edit_outlined, text: Utils.chestPain),
              SizedBox(height: HeightManager.h20),
              const AppDivider(),
              SizedBox(height: HeightManager.h20),

              // ----- Payment Detail -----
              SectionHeader(title: Utils.paymentDetail),
              SizedBox(height: HeightManager.h14),
              PaymentRow(label: Utils.consultation, value: Utils.$60_00),
              SizedBox(height: HeightManager.h12),
              PaymentRow(label: Utils.adminFee, value: Utils.$01_00),
              SizedBox(height: HeightManager.h12),
              PaymentRow(label: Utils.additionalDiscount, value: '-'),
              SizedBox(height: HeightManager.h14),
              PaymentRow(
                label: Utils.total,
                value: Utils.$61_00,
                isTotal: true,
              ),

              SizedBox(height: HeightManager.h24),

              // ----- Payment Method -----
              SectionHeader(title: Utils.paymentMethod),
              SizedBox(height: HeightManager.h12),
              PaymentMethodCard(onChangeTap: () {}),

              SizedBox(height: HeightManager.h20),
            ],
          ),
        ),
        bottomNavigationBar: AppointmentBottomBar(
          total: Utils.$61_00,
          onBookingTap: () => _onBookingTap(context),
        ),
      );
    }
  }
}

void _onBookingTap(BuildContext context) {
  PaymentSuccessDialog.show(
    context,
    onChatDoctorTap: () {
      Navigator.of(context).pop(); // قفل الـ dialog
    },
  );
}
