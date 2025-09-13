import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:railway_ticket_booking_app/core/constants/colors.dart';
import 'package:railway_ticket_booking_app/features/Onboarding/state/on_boarding_provider.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/Login_Screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<OnBoardingProvider>(
      builder: (ctx, controller, __) {
        return Scaffold(
          body: Stack(
            children: [
              // 👇 Main PageView
              PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, int index) {
                  final page = controller.onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(page["animation"]!, fit: BoxFit.contain),
                        const SizedBox(height: 16),
                        Text(
                          page["title"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          page["subtitle"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // 👇 Next / Get Started button at top-right
              Positioned(
                bottom: 20,  // adjust for safe area
                right: 17,
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (controller.islastPage()) {
                        await controller.completeOnboarding();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      } else {
                        controller.nextPage();
                      }
                    },
                    child: Text(
                      controller.islastPage() ? "Get Started" : "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // 👇 Smooth page indicator at bottom-center
              Positioned(
                bottom: 30,
                left: 0,
                right: 240,
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.currentPage,
                    count: controller.onboardingData.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.primaryDark,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    //
  }
}













