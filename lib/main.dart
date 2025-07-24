import 'package:flutter/material.dart';
import 'package:recharge_app/constants/appTheme.dart';
import 'package:recharge_app/screens/auth/otp_verification_screen.dart';
import 'package:recharge_app/screens/auth/registration_screen.dart';
import 'package:recharge_app/screens/auth/registration_steps_screen.dart';
import 'package:recharge_app/screens/auth/verify_mobile_screen.dart';
import 'package:recharge_app/screens/home/home_screen.dart';
import 'package:recharge_app/screens/services_screens/add_bank_screen.dart';
import 'package:recharge_app/screens/services_screens/add_funds_screen.dart';
import 'package:recharge_app/screens/services_screens/recharge_screen.dart';
import 'package:recharge_app/screens/services_screens/transactions_report_screen.dart';
import 'package:recharge_app/screens/services_screens/wallet_summary_screen.dart';

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
      home: RechargeScreen(),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {'/verify-mobile': (context) => const VerifyMobileScreen()},
    );
  }
}
