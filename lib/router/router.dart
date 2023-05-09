import 'package:course_mobile/pages/auth/otp.dart';
import 'package:course_mobile/pages/auth/register_page.dart';
import 'package:course_mobile/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class RouterAPI {
  static const home = "/home";
  static const login = "/login";
  static const register = "/register";
  static const otp = "/otp";
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
          builder: (context) => ChangeNotifierProvider(
            create: (_) => AuthProvider()
            ..sendOTP(),
            child: OtpPage(),
          ),
        );
      default:
        throw const FormatException("Route not found! check routes again!");
    }
  }
}
