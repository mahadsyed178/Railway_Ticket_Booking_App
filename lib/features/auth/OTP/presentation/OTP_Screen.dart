import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:railway_ticket_booking_app/features/dashboard/presentation/DashBoard_Screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email; // pass user email from forgot password
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String _otpCode = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('lib/core/constants/assets/images/Enter OTP-amico.svg',
                height: 200,
                ),
                // 🔹 Title
                SizedBox(height: 15,),
                Text(
                  "Verify OTP",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                // 🔹 Info text
                Text(
                  "Enter the verification code",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "We have sent an OTP to your email: ${widget.email}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // 🔹 OTP input field (using Pinput package)
                Pinput(
                  length: 6, // 6-digit OTP
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 56,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {

                    setState(() {
                      _otpCode = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // 🔹 Verify Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _otpCode.length == 6
                        ? () {
                      // TODO: Implement OTP verification logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "OTP Verified for ${widget.email}")),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    } : null,
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 🔹 Resend OTP
                TextButton(
                  onPressed: () {
                    // TODO: Resend OTP logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("OTP resent to ${widget.email}")),
                    );
                  },
                  child: const Text(
                    "Resend OTP",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

