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
    MedicalItem(title: Utils.general, icon: FontAwesomeIcons.stethoscope),
    MedicalItem(title: Utils.lungs, icon: FontAwesomeIcons.lungs),
    MedicalItem(title: Utils.dentist, icon: FontAwesomeIcons.tooth),
    MedicalItem(title: Utils.psychiatrist, icon: FontAwesomeIcons.brain),
    MedicalItem(title: Utils.covid, icon: FontAwesomeIcons.virus),
    MedicalItem(title: Utils.surgeon, icon: FontAwesomeIcons.syringe),
    MedicalItem(title: Utils.cardiologist, icon: FontAwesomeIcons.heartPulse),
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