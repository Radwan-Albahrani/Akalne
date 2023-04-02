import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/recipient/features/homeMenu/controller/home_menu_controller.dart';
import 'package:akalne/recipient/features/homeMenu/screens/restaurant_page.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/restaurant_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils.dart';
import '../../../../../theme/app_colors.dart';

class OrderItemCard extends ConsumerStatefulWidget {
  const OrderItemCard({
    super.key,
    required this.orderModel,
    required this.color,
  });

  final OrderModel orderModel;
  final Color color;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends ConsumerState<OrderItemCard> {
  void showReason() {
    // TODO: Show reason if exists
  }

  void goToRestaurantPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantPage(
            restaurantDetails: widget.orderModel.meal.menuItem.restaurant),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: goToRestaurantPage,
          child: Container(
            height: 130.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.h,
                        height: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.orderModel.meal.menuItem.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            widget.orderModel.meal.menuItem.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
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
                                "#${widget.orderModel.id}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
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
                                timeAgoSinceDate(widget.orderModel.dateCreated),
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
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RestaurantLogo(
                      image: widget.orderModel.meal.menuItem.restaurant
                          .restaurantLogo as String,
                      radius: 15.sp,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      widget.orderModel.meal.menuItem.restaurant.name as String,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50.h,
          width: double.infinity,
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
          child: GestureDetector(
            onTap: widget.orderModel.reason != null ? showReason : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                  Text(
                    "Status: ${widget.orderModel.status}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
