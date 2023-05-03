import 'package:course_mobile/pages/auth/login_page.dart';
import 'package:course_mobile/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      onGenerateRoute: RouterAPI.generateRoutes,
    );
  }
}


