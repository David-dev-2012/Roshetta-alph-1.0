import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:rosheta_ai/core/resources/route_manager.dart';
import 'package:rosheta_ai/core/resources/utils.dart';

import '../../model/main_components_model.dart';
import '../../model/medical_item.dart';
import '../../model/medicine_cart_model.dart';
import '../../model/payment_details_model.dart';
import '../../model/popular_products_model.dart';
import '../../model/product_on_sale_model.dart';
import '../../model/recent_doctors_model.dart';
import '../../model/top_doctors_model.dart';
import 'assets_values_manager.dart';

class ConstValueManager {
  ConstValueManager._();

  /// ================== Categories ==================
  static List<MainComponentsModel> listAllCategories = [
    MainComponentsModel(
      title: Utils.scan,
      icon: Icons.document_scanner_rounded,
      route: RoutesName.scan,
      // TODO: navigate to Scan Page
    ),
    MainComponentsModel(
      title: Utils.nearby,
      icon: Icons.place_outlined,
      route: RoutesName.locationPage,
      // TODO: navigate to Location Page (Map / Nearby pharmacies)
    ),
    MainComponentsModel(
      title: Utils.donates,
      icon: Icons.favorite_border,
      route: RoutesName.myDonations,
      // TODO: navigate to Donations Page
    ),
    MainComponentsModel(
      title: Utils.efforts,
      icon: Icons.star_border,
      route: RoutesName.rewards,
      // TODO: navigate to Efforts Page
    ),
    MainComponentsModel(
      title: Utils.doctors,
      icon: Icons.medical_services,
      route: RoutesName.topDoctor,
      // TODO: navigate to Doctors List Page
    ),
  ];

  /// ================== Popular Products ==================
  static List<PopularProductsModel> listPopularProductSales = [
    PopularProductsModel(
      medicineImage: AssetsValuesManager.panadolImage,
      medicineName: Utils.panadol,
      medicinePieces: Utils.x20pcs,
      medicinePrice: Utils.$15x99,
      route: RoutesName.detailsPage,
      des: "desc 1",
      rating: 4.5,
      // TODO: navigate to Product Details Page
    ),
    PopularProductsModel(
      medicineImage: AssetsValuesManager.bodrexHerbalImage,
      medicineName: Utils.bodrexHerbal,
      medicinePieces: Utils.x75ml,
      medicinePrice: Utils.$7x99,
      route: RoutesName.detailsPage,
      des: "desc 2",
      rating: 4.5,
      // TODO: navigate to Product Details Page
    ),
    PopularProductsModel(
      medicineImage: AssetsValuesManager.konidenImage,
      medicineName: Utils.konidin,
      medicinePieces: Utils.x3pcs,
      medicinePrice: Utils.$5x99,
      route: RoutesName.detailsPage,
      des: "desc 3",
      rating: 4.5,
      // TODO: navigate to Product Details Page
    ),
  ];

  /// ================== Products On Sale ==================
  static List<ProductOnSaleModel> listProductsOnSale = [
    ProductOnSaleModel(
      medicineImage: AssetsValuesManager.obhCombi,
      medicineName: Utils.oBHCombi,
      medicinePieces: Utils.x20pcs,
      medicinePrice: Utils.$15x99,
      olderPrice: Utils.$10x99Before,
      route: RoutesName.detailsPage,
      rating: 4,
      des: 'product des',
      // TODO: navigate to Product Details Page
    ),
    ProductOnSaleModel(
      medicineImage: AssetsValuesManager.bodrexHerbalImage,
      medicineName: Utils.bodrexHerbal,
      medicinePieces: Utils.x75ml,
      medicinePrice: Utils.$7x99,
      olderPrice: Utils.$8x99Before,
      route: RoutesName.detailsPage,
      rating: 4,
      des: 'product des',
      // TODO: navigate to Product Details Page
    ),
    ProductOnSaleModel(
      medicineImage: AssetsValuesManager.konidenImage,
      medicineName: Utils.konidin,
      medicinePieces: Utils.x3pcs,
      medicinePrice: Utils.$5x99,
      olderPrice: Utils.$7x99Before,
      route: RoutesName.detailsPage,
      rating: 4,
      des: 'product des',
      // TODO: navigate to Product Details Page
    ),
  ];

  /// ================== Medical Categories ==================
  static final List<MedicalItem> medicalItems = [
    MedicalItem(
      title: Utils.general,
      icon: FontAwesomeIcons.stethoscope,
      color: Color(0xFF0EA5E9),
      tips: [Utils.generalTips1, Utils.generalTips2, Utils.generalTips3, Utils.generalTips4],
    ),
    MedicalItem(
      title: Utils.lungs,
      icon: FontAwesomeIcons.lungs,
      color: Color(0xFF06B6D4),
      tips: [Utils.lungsTips1, Utils.lungsTips2, Utils.lungsTips3, Utils.lungsTips4],
    ),
    MedicalItem(
      title: Utils.dentist,
      icon: FontAwesomeIcons.tooth,
      color: Color(0xFFF59E0B),
      tips: [Utils.dentistTips1, Utils.dentistTips2, Utils.dentistTips3, Utils.dentistTips4],
    ),
    MedicalItem(
      title: Utils.psychiatrist,
      icon: FontAwesomeIcons.brain,
      color: Color(0xFF8B5CF6),
      tips: [Utils.psychiatristTips1, Utils.psychiatristTips2, Utils.psychiatristTips3, Utils.psychiatristTips4],
    ),
    MedicalItem(
      title: Utils.covid,
      icon: FontAwesomeIcons.virus,
      color: Color(0xFFEF4444),
      tips: [Utils.covidTips1, Utils.covidTips2, Utils.covidTips3, Utils.covidTips4],
    ),
    MedicalItem(
      title: Utils.surgeon,
      icon: FontAwesomeIcons.syringe,
      color: Color(0xFF3B82F6),
      tips: [Utils.surgeonTips1, Utils.surgeonTips2, Utils.surgeonTips3, Utils.surgeonTips4],
    ),
    MedicalItem(
      title: Utils.cardiologist,
      icon: FontAwesomeIcons.heartPulse,
      color: Color(0xFFEC4899),
      tips: [Utils.cardiologistTips1, Utils.cardiologistTips2, Utils.cardiologistTips3, Utils.cardiologistTips4],
    ),
  ];

  /// ================== Top Doctors ==================
  static List<TopDoctorsModel> listTopDoctors = [
    TopDoctorsModel(
      doctorImage: AssetsValuesManager.doctorHorizoImage,
      doctorName: Utils.drMarcusHorizon,
      doctorSpecialty: Utils.marcusSpecialty,
      doctorRate: Utils.marcusRate,
      doctorDistanceAway: Utils.marcusDistanceAway,
      route: RoutesName.doctorDetails,
    ),
    TopDoctorsModel(
      doctorImage: AssetsValuesManager.doctorMariaImage,
      doctorName: Utils.drMariaElena,
      doctorSpecialty: Utils.mariaSpecialty,
      doctorRate: Utils.mariaRate,
      doctorDistanceAway: Utils.marcusDistanceAway,
      route: RoutesName.doctorDetails,
    ),
    TopDoctorsModel(
      doctorImage: AssetsValuesManager.doctorSteviImage,
      doctorName: Utils.drSteviJessi,
      doctorSpecialty: Utils.steviSpecialty,
      doctorRate: Utils.steviRate,
      doctorDistanceAway: Utils.steviDistanceAway,
      route: RoutesName.doctorDetails,
    ),
  ];

  /// ================== Recent Doctors ==================
  static List<RecentDoctorModel> listRecentDoctors = [
    RecentDoctorModel(
      doctorImage: AssetsValuesManager.doctorMarcusImage,
      doctorName: Utils.drMarcusHorizon,
      doctorSpecialty: Utils.mariaSpecialty,
      doctorRate: Utils.mariaRate,
      doctorDistanceAway: Utils.marcusDistanceAway,
      route: RoutesName.doctorDetails,
    ),
    RecentDoctorModel(
      doctorImage: AssetsValuesManager.doctorMariaImage,
      doctorName: Utils.drMariaElena,
      doctorSpecialty: Utils.mariaSpecialty,
      doctorRate: Utils.mariaRate,
      doctorDistanceAway: Utils.marcusDistanceAway,
      route: RoutesName.doctorDetails,
    ),
    RecentDoctorModel(
      doctorImage: AssetsValuesManager.doctorSteviImage,
      doctorName: Utils.drSteviJessi,
      doctorSpecialty: Utils.steviSpecialty,
      doctorRate: Utils.steviRate,
      doctorDistanceAway: Utils.steviDistanceAway,
      route: RoutesName.doctorDetails,
    ),
    RecentDoctorModel(
      doctorImage: AssetsValuesManager.doctorLukeImage,
      doctorName: Utils.drLuke,
      doctorSpecialty: Utils.psychiatrist,
      doctorRate: Utils.steviRate,
      doctorDistanceAway: Utils.steviDistanceAway,
      route: RoutesName.doctorDetails,
    ),
  ];
  /// ================== Cart ==================
  static List<MedicineCartModel> listMedicineCartModel = [
    MedicineCartModel(
      medicineImage: AssetsValuesManager.bodrexHerbalImage,
      medicineName: Utils.bodrexHerbal,
      medicinePieces: Utils.x75ml,
      medicinePrice: Utils.$7x99,
    ),
    MedicineCartModel(
      medicineImage: AssetsValuesManager.panadolImage,
      medicineName: Utils.panadol,
      medicinePieces: Utils.x20pcs,
      medicinePrice: Utils.$15x99,
    ),
  ];

  /// ================== Payment ==================
  static List<PaymentDetailsModel> listPaymentDetails = [
    PaymentDetailsModel(titleDetail: Utils.subTotal, detail: Utils.d$25x99),
    PaymentDetailsModel(titleDetail: Utils.taxes, detail: Utils.d$1x00),
    PaymentDetailsModel(titleDetail: Utils.total, detail: Utils.d$26x98),
  ];



}