import 'package:flutter/material.dart';

class RoundedFormField extends StatelessWidget {
  const RoundedFormField({
    super.key,
    required this.controller,
    this.isSecret = false,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final bool isSecret;
  final TextInputType keyboardType;
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
        keyboardType: keyboardType,
        obscureText: isSecret,
        autocorrect: !isSecret,
        enableSuggestions: !isSecret,
        validator: validator);
  }
}
