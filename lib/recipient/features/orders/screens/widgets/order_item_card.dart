import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/recipient/features/homeMenu/controller/home_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      height: 160.h,
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
      constraints: BoxConstraints(
        minHeight: 160.h,
        maxHeight: 160.h,
        minWidth: MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Column(
        children: [
          Container(
            height: 110.h,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            constraints: BoxConstraints(
              minHeight: 110.h,
              maxHeight: 110.h,
              minWidth: MediaQuery.of(context).size.width,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(widget.orderModel.meal.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.orderModel.meal.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 200.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: AppColors.light["primaryTransparent"],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "#${widget.orderModel.id.toString()}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.light["primary"],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 200.w,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.light["secondaryTransparent"],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              () {
                                final date = widget.orderModel.dateCreated;
                                final now = DateTime.now();
                                final parsedDate = DateTime.parse(date);
                                final difference = now.difference(parsedDate);
                                if (difference.inDays > 0) {
                                  return "${difference.inDays} Days Ago";
                                } else if (difference.inHours > 0) {
                                  return "${difference.inHours} Hours Ago";
                                } else if (difference.inMinutes > 0) {
                                  return "${difference.inMinutes} Minutes Ago";
                                } else {
                                  return "Just Now";
                                }
                              }.call(),
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
              ],
            ),
          ),
          Expanded(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
