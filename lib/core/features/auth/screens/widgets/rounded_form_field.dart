import 'package:flutter/material.dart';

class RoundedFormField extends StatelessWidget {
  const RoundedFormField({
    super.key,
    required this.controller,
    this.isSecret = false,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.label,
    this.validator,
    this.maxLines,
  });

  final TextEditingController controller;
  final bool isSecret;
  final TextInputType keyboardType;
  final String hintText;
  final String? label;
  final String? Function(String?)? validator;
  final int? maxLines;

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
          labelText: label,
        ),
        maxLines: isSecret ? 1 : maxLines,
        keyboardType: keyboardType,
        obscureText: isSecret,
        autocorrect: !isSecret,
        enableSuggestions: !isSecret,
        validator: validator);
  }
}
