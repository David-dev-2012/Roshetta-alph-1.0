import 'package:flutter/widgets.dart';

import '../resources/route_manager.dart';

class AppNavigation {
  AppNavigation._();

  static Future<Object?> pushReplacementNamed(
      BuildContext context,
      RoutesName routesName, {
        Object? args,
      }) async {
    return await Navigator.pushReplacementNamed(
      context,
      routesName.routeName,
      arguments: args,
    );
  }

  static Future<Object?> pushNamed(
      BuildContext context,
      RoutesName routesName, {
        Object? args,
      }) async {
    return await Navigator.pushNamed(
      context,
      routesName.routeName,
      arguments: args,
    );
  }

  static Future<Object?> pushAndRemoveUntil(
      BuildContext context,
      RoutesName routesName, {
        Object? args,
      }) async {
    return await Navigator.pushNamedAndRemoveUntil(
      context,
      routesName.routeName,
          (route) => false,
      arguments: args,
    );
  }
}