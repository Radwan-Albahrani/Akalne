import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 40.h,
        width: 40.w,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
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
            size: 25.sp,
          ),
        ),
      ),
    );
  }
}
