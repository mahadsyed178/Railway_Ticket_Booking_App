import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:railway_ticket_booking_app/core/constants/colors.dart';
import 'package:railway_ticket_booking_app/features/auth/ForgotPassword/Forgot_password_Screen.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/components/Input_Text_Field.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/state/login_provider.dart';
import 'package:railway_ticket_booking_app/features/auth/SignupScreen/Sign_up_Screen.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                // scroll safe for small screens
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('lib/core/constants/assets/images/Queue-amico.svg',
                    height: 205,
                    ),
                    // 🔹 Welcome header
                    const Text(
                      "Welcome to Rail-Link",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Connecting Journeys, Simplifying Travel",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    // 🔹 Email Field
                    InputTextField(
                      controller: provider.emailController,
                      labelText: "Email",
                      icon: const FaIcon(FontAwesomeIcons.envelope, size: 18),
                      errorText: provider.emailError,
                      autofillHints: const [AutofillHints.email],
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Password Field
                    InputTextField(
                      controller: provider.passwordController,
                      labelText: "Password",
                      icon: const FaIcon(FontAwesomeIcons.lock, size: 18),
                      obscureText: true,
                      errorText: provider.passwordError,
                      autofillHints: const [AutofillHints.password],
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Forgot Password clicked"),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🔹 Modern Login Button (shrunk)
                    provider.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                      width: double.infinity,
                      height: 44, // reduced height
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10), // tighter padding
                          backgroundColor: Colors.deepPurple,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () async {
                          try {
                            await provider.login(context);
                            if (provider.isLoggedIn) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login Successful!"),
                                ),
                              );
                              // TODO: Navigate to Home screen
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16, // slightly smaller
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Sign up navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 55),

                    // 🔹 Divider with text
                    Row(
                      children: const [
                        Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Or continue with"),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),

                    const SizedBox(height: 39),

                    // 🔹 Social Login Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gmail
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.envelope,
                            color: Colors.red,
                          ),
                          iconSize: 30, // smaller
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login with Gmail clicked"),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),

                        // Google
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.blueAccent,
                          ),
                          iconSize: 30,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login with Google clicked"),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),

                        // Facebook
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blueAccent,
                          ),
                          iconSize: 30,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login with Facebook clicked"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
