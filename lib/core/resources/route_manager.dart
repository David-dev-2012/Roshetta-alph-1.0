import 'package:flutter/material.dart';
import 'package:rosheta_ai/view/top_doctor_page/screen/top_doctor_page.dart';

import '../../view/add_medicine_page/screen/add_medicine.dart';
import '../../view/basket_card_page/sreen/medicine_page.dart';
import '../../view/cart_page/screen/my_cart_page.dart';
import '../../view/choose_page/screen/choose_page.dart';
import '../../view/create_new_password_page/screen/create_new_password_page.dart';
import '../../view/details_page/screen/details_page.dart';
import '../../view/doctor_consultation_page/screen/appointment_page.dart';
import '../../view/doctor_consultation_page/screen/doctor_details_page.dart';
import '../../view/doctor_consultation_page/screen/find_doctor_page.dart';
import '../../view/forget_password_page/screen/forget_password_page.dart';
import '../../view/home_page/screen/home_page.dart';
import '../../view/incoming_orders_page/screen/incoming_orders.dart';
import '../../view/location_page/screen/location_page.dart';
import '../../view/login_intro_page/screen/login_intro_page.dart';
import '../../view/login_page/screen/login_page.dart';
import '../../view/my_donation_page/screen/my_donation.dart';
import '../../view/my_orders_page/screen/my_orders.dart';
import '../../view/on_boarding_page/screen/on_boarding_page.dart';
import '../../view/pharmacy_dashboard_page/screen/pharmacy_dashboard_page.dart';
import '../../view/pharmacy_dashboard_page/screen/pharmacy_home_page.dart';
import '../../view/profile_page/screen/profile_page.dart';
import '../../view/reward_page/screen/reward_screen.dart';
import '../../view/scan_page/screen/scan_qr_page.dart';
import '../../view/sign_up_page/screen/sign_up_page.dart';
import '../../view/splash_page/screen/splash_page.dart';
import '../../view/verified_forget_password_page/screen/verified_forget_password_page.dart';
import '../widget/unknown_route_page.dart';

class RoutesManager {
  RoutesManager._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;

    if (settings.name == RoutesName.splash.routeName) {
      page = const SplashPage();

    } else if (settings.name == RoutesName.onBoarding.routeName) {
      page = const OnBoardingPage();

    } else if (settings.name == RoutesName.loginIntro.routeName) {
      page = const LoginIntroPage();

    } else if (settings.name == RoutesName.login.routeName) {
      page = const LoginPage();

    } else if (settings.name == RoutesName.signUp.routeName) {
      page = const SignUpPage();

    } else if (settings.name == RoutesName.forgetPassword.routeName) {
      page = const ForgetPasswordPage();

    } else if (settings.name ==
        RoutesName.verifiedForgetPassword.routeName) {
      page = const VerifiedForgetPasswordPage();

    } else if (settings.name ==
        RoutesName.createNewPassword.routeName) {
      page = const CreateNewPasswordPage();

    } else if (settings.name == RoutesName.choose.routeName) {
      page = const ChoosePage();

    } else if (settings.name == RoutesName.home.routeName) {
      page = const HomePage();

    } else if (settings.name == RoutesName.detailsPage.routeName) {
      page = const DetailsPage();

    } else if (settings.name == RoutesName.findDoctor.routeName) {
      page = FindDoctorPage();

    } else if (settings.name == RoutesName.doctorDetails.routeName) {
      page = DoctorDetailsPage();

    } else if (settings.name == RoutesName.appointment.routeName) {
      page = AppointmentPage();

    } else if (settings.name == RoutesName.cart.routeName) {
      page = const CartPage();

    } else if (settings.name == RoutesName.locationPage.routeName) {
      page = const LocationPage();

    } else if (settings.name == RoutesName.profile.routeName) {
      page = const ProfilePage();

    } else if (settings.name == RoutesName.myOrders.routeName) {
      page = const MyOrdersPage();

    } else if (settings.name == RoutesName.myDonations.routeName) {
      page = const MyDonationsPage();

    } else if (settings.name == RoutesName.rewards.routeName) {
      page = const RewardPointsPage();

    } else if (settings.name == RoutesName.pharmacyHome.routeName) {
      page = const PharmacyHomePage();

    } else if (settings.name ==
        RoutesName.pharmacyDashboard.routeName) {
      page = const PharmacyDashboardPage();

    } else if (settings.name == RoutesName.scan.routeName) {
      page = const ScanQrPage();

    } else if (settings.name == RoutesName.addMedicine.routeName) {
      page = const AddMedicinePage();

    } else if (settings.name ==
        RoutesName.incomingOrders.routeName) {
      page = const IncomingOrdersPage();

    } else if (settings.name == RoutesName.medicinePage.routeName) {
      page = const MedicineScreen();

    } else if (settings.name == RoutesName.topDoctor.routeName) {
      page = const TopDoctorScreen();

    } else {
      page = const UnknownRoutePage();
    }

    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
    );
  }
}

// ── Route Names Enum ─────────────────────────────────────────────────────────
// Use these constants everywhere instead of raw strings to avoid typos
enum RoutesName {
  splash('/'),
  onBoarding('/onboardingPage'),
  loginIntro('/welcomePage'),
  login('/loginPage'),
  signUp('/signUpPage'),
  forgetPassword('/forgetPasswordPage'),
  verifiedForgetPassword('/verifiedForgetPasswordPage'),
  createNewPassword('/createPasswordNewPage'),
  choose('/choosePage'),

  // User
  home('/homePage'),
  detailsPage('/detailsPage'),
  findDoctor('/findDoctorPage'),
  doctorDetails('/doctorDetailsPage'),
  topDoctor('/topDoctorPage'),
  appointment('/appointmentPage'),
  cart('/cartPage'),
  locationPage('/locationPage'),
  profile('/profilePage'),
  myOrders('/myOrdersPage'),
  myDonations('/myDonationsPage'),
  rewards('/rewardsPage'),

  // Basket / Medicine
  medicinePage('/medicinePage'),

  // Pharmacy
  pharmacyHome('/pharmacyHomePage'),
  pharmacyDashboard('/pharmacyDashboardPage'),
  scan('/scanQrPage'),
  addMedicine('/addMedicinePage'),
  incomingOrders('/incomingOrdersPage');

  final String routeName;
  const RoutesName(this.routeName);
}
