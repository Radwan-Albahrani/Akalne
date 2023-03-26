import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/app_colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 140.h,
      width: 120.w,
      child: Column(
        children: [
          ClipRRect(
            // only from top right and top left
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "assets/images/food.png",
              height: 90.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 15.h,
            child: Text(
              'Food Name ',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.light["secondary"],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
