import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 50,
        width: 50,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.light["primaryTransparent"],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            elevation: 0.0,
            shadowColor: Colors.transparent,
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.light["primary"],
            size: 25,
          ),
        ),
      ),
    );
  }
}
