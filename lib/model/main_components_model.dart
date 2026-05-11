import 'package:flutter/cupertino.dart';

import '../core/resources/route_manager.dart';

class MainComponentsModel{
  final String title;
  final IconData? icon;
  final RoutesName route;
  MainComponentsModel({
    required this.title,
    this.icon,
    required this.route
  });
}
