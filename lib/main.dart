import 'package:flutter/material.dart';
import 'package:recharge_app/screens/auth/otp_verification_screen.dart';
import 'package:recharge_app/screens/auth/registration_screen.dart';
import 'package:recharge_app/screens/auth/registration_steps_screen.dart';
import 'package:recharge_app/screens/auth/verify_mobile_screen.dart';
import 'package:recharge_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recharge app',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {'/verify-mobile': (context) => const VerifyMobileScreen()},
    );
  }
}
