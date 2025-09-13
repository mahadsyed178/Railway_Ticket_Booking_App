import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isLoggedIn = false;

  String? emailError;
  String? passwordError;

  LoginProvider() {
    // 👇 listen to changes and clear errors automatically
    emailController.addListener(() {
      if (emailError != null && emailController.text.isNotEmpty) {
        emailError = null;
        notifyListeners();
      }
    });

    passwordController.addListener(() {
      if (passwordError != null && passwordController.text.isNotEmpty) {
        passwordError = null;
        notifyListeners();
      }
    });
  }

  /// Load status on app startup
  Future<void> loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("logged_in") ?? false;
    notifyListeners();
  }

  /// Fake login → checks dummy credentials → then navigate to Signup
  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    const dummyEmail = "mahadsyed909@gmail.com";
    const dummyPassword = "03254967933900";

    // Reset errors
    emailError = null;
    passwordError = null;

    // Empty field validation
    if (email.isEmpty) {
      emailError = "Email is required";
    }
    if (password.isEmpty) {
      passwordError = "Password is required";
    }

    if (emailError != null || passwordError != null) {
      notifyListeners();
      return;
    }

    // Wrong credentials
    if (email != dummyEmail || password != dummyPassword) {
      emailError = "Invalid email" ;
      passwordError = "Invalid password";
      notifyListeners();
      return;
    }

    // ✅ Success case
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("logged_in", true);

    isLoggedIn = true;
    isLoading = false;

    emailError = null;
    passwordError = null;

    notifyListeners();

    // Navigator.pushReplacementNamed(context, "/signup");
  }

  /// Logout clears everything
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("logged_in");
    isLoggedIn = false;
    emailController.clear();
    passwordController.clear();
    emailError = null;
    passwordError = null;
    notifyListeners();
  }
}
