import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/recipient/features/homeMenu/controller/home_menu_controller.dart';
import 'package:akalne/recipient/features/homeMenu/screens/restaurant_page.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/back_button.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/food_image_favorite.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/restaurant_logo.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FoodDetails extends ConsumerStatefulWidget {
  const FoodDetails({
    super.key,
    required this.publishedMealModel,
    required this.dateCreated,
    this.isFavorite = false,
    this.isReplace = false,
  });

  final PublishedMealModel publishedMealModel;
  final bool isFavorite;
  final bool isReplace;
  final String dateCreated;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends ConsumerState<FoodDetails> {
  @override
  void initState() {
    super.initState();
  }

  void addMeal() {
    ref
        .read(homeMenuControllerProvider.notifier)
        .reserveMeal(widget.publishedMealModel, count, context);
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(homeMenuControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBackButton(),
              SizedBox(height: 20.h),
              Column(
                children: [
                  FoodImageFavorite(
                    foodImage: widget.publishedMealModel.menuItem.image,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget.publishedMealModel.menuItem.name,
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          if (!widget.isReplace) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RestaurantPage(
                                  restaurantDetails: widget
                                      .publishedMealModel.menuItem.restaurant,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => RestaurantPage(
                                  restaurantDetails: widget
                                      .publishedMealModel.menuItem.restaurant,
                                ),
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RestaurantLogo(
                              image: widget.publishedMealModel.menuItem
                                  .restaurant.restaurantLogo as String,
                              radius: 15.sp,
                            ),
                            SizedBox(width: 10.h),
                            Text(
                              widget.publishedMealModel.menuItem.restaurant.name
                                  as String,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              minimumSize: const Size(40, 40),
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: AppColors.light["primary"],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (count <
                                    widget.publishedMealModel.quantity) {
                                  count++;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.light["primary"],
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              minimumSize: const Size(40, 40),
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.publishedMealModel.menuItem.description,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: AppColors.light["primary"],
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Date Added: ",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              Text(
                                () {
                                  final date = widget.dateCreated;
                                  DateTime dateAdded = DateTime.parse(date);
                                  final formattedDate = DateFormat.yMEd()
                                      .add_jms()
                                      .format(dateAdded);
                                  return formattedDate;
                                }.call(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.shopping_basket_outlined,
                                color: AppColors.light["primary"],
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Maximum Order: ",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              Text(
                                widget.publishedMealModel.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.light["primary"],
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Address: ",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  widget.publishedMealModel.menuItem.restaurant
                                      .address as String,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: double.infinity,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : addMeal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.light["primary"],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: isLoading
                              ? const Loader()
                              : Text(
                                  "Reserve",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
