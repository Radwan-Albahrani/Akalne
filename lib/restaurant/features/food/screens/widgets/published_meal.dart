import 'package:akalne/core/models/published_meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils.dart';
import '../../../../../theme/app_colors.dart';
import '../../../menu/screens/widgets/add_published_meal_dialog.dart';
import '../../controller/food_controller.dart';

class PublishedMeal extends ConsumerWidget {
  final PublishedMealModel meal;

  const PublishedMeal({super.key, required this.meal});

  void publishedMealDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AddPublishedMealDialog(
          menuItemModel: meal.menuItem,
          type: "Update",
          mealCount: meal.quantity,
          publishedMealModel: meal),
    );
  }

  void deletePublishedMeal(BuildContext context, WidgetRef ref) {
    ref.read(foodControllerProvider.notifier).deletePublishedMeal(
          meal: meal,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 85.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(meal.menuItem.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 145.w,
                  ),
                  child: Text(
                    meal.menuItem.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 150.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: AppColors.light["primaryTransparent"],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Available: ${meal.quantity}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.light["primary"],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 150.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: AppColors.light["secondaryTransparent"],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      timeAgoSinceDate(meal.createdAt),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.light["secondary"],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.light["primary"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () => publishedMealDialog(context),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.light["secondary"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () => deletePublishedMeal(context, ref),
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
