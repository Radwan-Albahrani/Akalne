import 'package:flutter/material.dart';

class RoundedFormField extends StatelessWidget {
  const RoundedFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none),
        hintText: hintText,
      ),
      obscureText: obscureText,
      validator: validator
    );
  }
}
