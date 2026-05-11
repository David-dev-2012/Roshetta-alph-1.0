
import '../core/resources/route_manager.dart';

class ProductOnSaleModel{
  final String medicineImage;
  final String medicineName;
  final String medicinePieces;
  final String medicinePrice;
  final String olderPrice;
  final RoutesName route;
  final String des;

  final double rating;

  ProductOnSaleModel({
    required this.medicineImage,
    required this.medicineName,
    required this.medicinePieces,
    required this.medicinePrice,
    required this.route,
    required this.rating,
    required this.des,
    required this.olderPrice
  });
  @override
  String toString() {
    // TODO: implement toString
    return "medicineName: $medicineName\n"
        "des : $des";
  }
}
