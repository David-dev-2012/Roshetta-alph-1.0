
import '../core/resources/route_manager.dart';

class TopDoctorsModel{
  final String doctorImage;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorRate;
  final String doctorDistanceAway;
  final RoutesName route;
  TopDoctorsModel({
    required this.doctorImage,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorRate,
    required this.doctorDistanceAway,
    required this.route
  }
  );
}