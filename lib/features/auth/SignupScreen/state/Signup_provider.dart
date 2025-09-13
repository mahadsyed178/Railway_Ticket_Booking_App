// import 'package:flutter/material.dart';
//
// class SignupProvider extends ChangeNotifier {
//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   // Validation Errors
//   String? nameError;
//   String? emailError;
//   String? passwordError;
//
//   // State
//   bool isLoading = false;
//   bool isSignedUp = false;
//
//   // 🔹 Validation
//   bool _validateInputs() {
//     bool isValid = true;
//
//     if (nameController.text.trim().isEmpty) {
//       nameError = "Name is required";
//       isValid = false;
//     } else {
//       nameError = null;
//     }
//
//     if (!emailController.text.contains("@")) {
//       emailError = "Enter a valid email";
//       isValid = false;
//     } else {
//       emailError = null;
//     }
//
//     if (passwordController.text.length < 6) {
//       passwordError = "Password must be at least 6 characters";
//       isValid = false;
//     } else {
//       passwordError = null;
//     }
//
//     notifyListeners();
//     return isValid;
//   }
//
//   // 🔹 Signup Logic
//   Future<void> signup(BuildContext context) async {
//     if (!_validateInputs()) return;
//
//     isLoading = true;
//     notifyListeners();
//
//     await Future.delayed(const Duration(seconds: 2)); // simulate API call
//
//     isLoading = false;
//     isSignedUp = true;
//     notifyListeners();
//   }
//
//   // 🔹 Dispose controllers
//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Validation Errors
  String? nameError;
  String? emailError;
  String? passwordError;

  // State
  bool isLoading = false;
  bool isSignedUp = false;

  SignupProvider() {
    // 🔹 Clear errors live when user types
    nameController.addListener(() {
      if (nameError != null) {
        nameError = null;
        notifyListeners();
      }
    });

    emailController.addListener(() {
      if (emailError != null) {
        emailError = null;
        notifyListeners();
      }
    });

    passwordController.addListener(() {
      if (passwordError != null) {
        passwordError = null;
        notifyListeners();
      }
    });
  }

  // 🔹 Validation
  bool _validateInputs() {
    bool isValid = true;

    if (nameController.text.trim().isEmpty) {
      nameError = "Name is required";
      isValid = false;
    } else {
      nameError = null;
    }

    if (!emailController.text.contains("@")) {
      emailError = "Enter a valid email";
      isValid = false;
    } else {
      emailError = null;
    }

    if (passwordController.text.length < 6) {
      passwordError = "Password must be at least 6 characters";
      isValid = false;
    } else {
      passwordError = null;
    }

    notifyListeners();
    return isValid;
  }

  // 🔹 Signup Logic
  Future<void> signup(BuildContext context) async {
    if (!_validateInputs()) return;

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    isLoading = false;
    isSignedUp = true;
    notifyListeners();
  }

  // 🔹 Dispose controllers
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
