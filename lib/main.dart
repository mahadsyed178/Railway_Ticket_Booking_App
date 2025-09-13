import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:railway_ticket_booking_app/core/constants/colors.dart';
import 'package:railway_ticket_booking_app/features/Onboarding/presentation/on_boarding_screen.dart';
import 'package:railway_ticket_booking_app/features/Onboarding/state/on_boarding_provider.dart';
import 'package:railway_ticket_booking_app/features/auth/ForgotPassword/Forgot_password_Screen.dart';
import 'package:railway_ticket_booking_app/features/auth/ForgotPassword/state/Forgot_password_provider.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/Login_Screen.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/state/login_provider.dart';
import 'package:railway_ticket_booking_app/features/auth/SignupScreen/Sign_up_Screen.dart';
import 'package:railway_ticket_booking_app/features/auth/SignupScreen/state/Signup_provider.dart';
import 'package:railway_ticket_booking_app/features/splash/presentation/splash_screen.dart';

void main() {
  runApp( MultiProvider(providers:[
    ChangeNotifierProvider(create: (_)=>OnBoardingProvider()),
    ChangeNotifierProvider(create:(_)=>LoginProvider()),
    ChangeNotifierProvider(create: (_)=>SignupProvider()),

  ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Railway Ricketing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: SplashScreen(),
      routes: {
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignupScreen(),
        "/onboarding":(context)=> OnBoardingScreen(),

      },
    );
  }
}
