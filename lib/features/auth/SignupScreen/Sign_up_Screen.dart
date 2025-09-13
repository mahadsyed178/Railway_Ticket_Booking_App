import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:railway_ticket_booking_app/core/constants/colors.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/Login_Screen.dart';
import 'package:railway_ticket_booking_app/features/auth/LoginScreen/components/Input_Text_Field.dart';
import 'package:railway_ticket_booking_app/features/auth/SignupScreen/state/Signup_provider.dart';




class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SvgPicture.asset('lib/core/constants/assets/images/traveling-back-to-home.svg',
                    height: 150,
                    ),
                    SizedBox(height: 23,),
                    // 🔹 Welcome Header
                    const Text(
                      "Join Rail-Link",
                      style: TextStyle(
                        fontSize: 26, // shrunk from 28
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Create your account and start your journey",
                      style: TextStyle(
                        fontSize: 14, // shrunk from 16
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    // 🔹 Full Name Field
                    InputTextField(
                      controller: provider.nameController,
                      labelText: "Full Name",
                      icon: const FaIcon(FontAwesomeIcons.user, size: 18),
                      errorText: provider.nameError,
                      autofillHints: const [AutofillHints.name],
                    ),
                    const SizedBox(height: 18),

                    // 🔹 Email Field
                    InputTextField(
                      controller: provider.emailController,
                      labelText: "Email",
                      icon: const FaIcon(FontAwesomeIcons.envelope, size: 18),
                      errorText: provider.emailError,
                      autofillHints: const [AutofillHints.email],
                    ),
                    const SizedBox(height: 18),

                    // 🔹 Password Field
                    InputTextField(
                      controller: provider.passwordController,
                      labelText: "Password",
                      obscureText: true,
                      icon: const FaIcon(FontAwesomeIcons.lock, size: 18),
                      errorText: provider.passwordError,
                      autofillHints: const [AutofillHints.password],
                    ),

                    const SizedBox(height: 24),

                    // 🔹 Modern Signup Button (shrunk)
                    provider.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                      width: double.infinity,
                      height: 44, // consistent with login
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10), // consistent padding
                          backgroundColor: Colors.deepPurple,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () async {
                          try {
                            await provider.signup(context);
                            if (provider.isSignedUp) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Signup Successful! 🎉"),
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16, // smaller for consistency
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Already have account? Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // 🔹 Divider with text
                    Row(
                      children: const [
                        Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Or sign up with"),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // 🔹 Social Signup Buttons (shrunk icons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.envelope,
                            color: Colors.red,
                          ),
                          iconSize: 30, // smaller
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signup with Gmail clicked"),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),

                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.blueAccent,
                          ),
                          iconSize: 30,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signup with Google clicked"),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 20),

                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blueAccent,
                          ),
                          iconSize: 30,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signup with Facebook clicked"),
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



