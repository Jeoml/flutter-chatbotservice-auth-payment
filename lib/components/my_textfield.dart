import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const MyTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText, 
      this.validator,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25), // Adds margin of 25
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade800,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16.0
          ),
        ),
        validator: validator,
      ),
    );
  }
}