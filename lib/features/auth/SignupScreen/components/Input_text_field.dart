import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget icon;
  final bool obscureText;
  final String? errorText;
  final Iterable<String>? autofillHints;
  const RoundedTextField({
    required this.controller,
    this.labelText ='',
    required this.icon,
    this.obscureText = false,
    this.errorText,
    this.autofillHints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        prefix: Padding(padding: const EdgeInsets.only(left: 9, right: 8),
          child: icon,
        ),

        labelText: labelText,
        filled: true,


        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: errorText != null ? Colors.red : Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: errorText != null ? Colors.red : Colors.blueAccent,
            width: 2,

          ),

        ),

      ),

    );
  }
}