
import '../core/resources/route_manager.dart';

class PopularProductsModel {
  final String medicineImage;
  final String medicineName;
  final String medicinePieces;
  final String medicinePrice;
  final RoutesName route;
  final String des;

  final double rating;

  const PopularProductsModel({
    required this.medicineImage,
    required this.des,
    required this.rating,
    required this.medicineName,
    required this.medicinePieces,
    required this.medicinePrice,
    required this.route,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "medicineImage: $medicineImage\n"
        "rating : $rating";
  }
}