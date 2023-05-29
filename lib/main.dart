// ignore_for_file: deprecated_member_use

import 'package:course_mobile/pages/auth/login_page.dart';
import 'package:course_mobile/provider/auth_provider.dart';
import 'package:course_mobile/router/router.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
  //   // your preferred provider. Choose from:fl
  //   // 1. debug provider
  //   // 2. safety net provider
  //   // 3. play integrity provider
  //   androidProvider: AndroidProvider.playIntegrity,
  //   appleProvider: AppleProvider.deviceCheck,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        onGenerateRoute: RouterAPI.generateRoutes,
      ),
    );
  }
}
