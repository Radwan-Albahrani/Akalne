import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedSearchField extends StatelessWidget {
  const RoundedSearchField({
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
          constraints:  BoxConstraints(maxHeight: 40.sp),
          prefixIcon: const Icon(Icons.search),
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
        validator: validator);
  }
}
