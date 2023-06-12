import 'dart:async';
import 'package:course_mobile/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../components/bottombar.dart';
import '../../provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Provider.of<AuthProvider>(context, listen: false)..validateToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthProvider>(builder: (_, authProvider, __) {
      if (authProvider.sucess == true) {
        return BottomBar();
      }
      if (authProvider.sucess == false) {
        return LoginPage();
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset("assets/animations/splash.json"),
          ],
        ),
      );
    }));
  }
}
