import 'package:course_mobile/components/bottombar.dart';
import 'package:course_mobile/pages/auth/otp.dart';
import 'package:course_mobile/pages/auth/register_page.dart';
import 'package:course_mobile/pages/home/home.dart';
import 'package:flutter/material.dart';

class RouterAPI {
  static const home = "/home";
  static const login = "/login";
  static const register = "/register";
  static const otp = "/otp";
  static const bottombar = "/bottombar";
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case otp:
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
        );
      case bottombar:
        return MaterialPageRoute(
          builder: (context) => BottomBar(),
        );
      default:
        throw const FormatException("Route not found! check routes again!");
    }
  }
}
