import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:railway_ticket_booking_app/core/constants/colors.dart';
import 'package:railway_ticket_booking_app/features/Onboarding/presentation/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _size = 100;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _size = 200;
      });
    });
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              "lib/core/constants/assets/animations/train Animation.json",
              height: 290,
              width: 290,
              fit: BoxFit.contain, // makes it scale nicely
            ),
          ),
          Text(
            "Smart Travel,Made Simple",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
            color: AppColors.text,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}









