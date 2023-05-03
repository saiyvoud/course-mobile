import 'package:course_mobile/pages/home/home.dart';
import 'package:flutter/material.dart';

class RouterAPI {
  static const home = "/home";
  static const login = "/login";
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        throw const FormatException("Route not found! check routes again!");
    }
  }
}
