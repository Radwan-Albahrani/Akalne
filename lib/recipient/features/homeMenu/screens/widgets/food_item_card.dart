import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/core/utils.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../food_details.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.publishedMealModel,
    required this.createdAt,
    this.isReplace = false,
  });

  final PublishedMealModel publishedMealModel;
  final bool isReplace;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isReplace) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodDetails(
                publishedMealModel: publishedMealModel,
                dateCreated: createdAt,
                isReplace: isReplace,
              ),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => FoodDetails(
                publishedMealModel: publishedMealModel,
                dateCreated: createdAt,
                isReplace: isReplace,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        child: Container(
            width: double.infinity,
            height: 90.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(publishedMealModel.menuItem.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 150.w,
                          minWidth: 100.w,
                        ),
                        child: Text(
                          publishedMealModel.menuItem.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        publishedMealModel.menuItem.restaurant.name as String,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 150.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          color: AppColors.light["secondaryTransparent"],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            timeAgoSinceDate(createdAt, numericDates: false),
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.light["secondary"],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 35.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.light["primaryTransparent"],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            publishedMealModel.menuItem.restaurant.distance,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.light["primary"],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
