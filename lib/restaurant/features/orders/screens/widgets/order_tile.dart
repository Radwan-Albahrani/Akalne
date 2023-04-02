// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:akalne/core/utils.dart';
import 'package:akalne/restaurant/features/orders/screens/widgets/add_note_dialog.dart';
import 'package:akalne/restaurant/features/orders/screens/widgets/view_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:akalne/core/models/order_model.dart';

import '../../../../../theme/app_colors.dart';
import '../../controller/orders_controller.dart';

class OrderTile extends ConsumerStatefulWidget {
  OrderModel order;
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderTileState();
}

class _OrderTileState extends ConsumerState<OrderTile> {
  Color color = Colors.yellow.shade700;

  @override
  void initState() {
    super.initState();
    if (widget.order.status == "Sent to Restaurant") {
      color = Colors.yellow.shade700;
    } else if (widget.order.status == "Accepted") {
      color = AppColors.light["primary"];
    } else if (widget.order.status == "Rejected") {
      color = AppColors.light["secondary"];
    }
  }

  void showDialogHandler() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AddNoteDialog(
        order: widget.order,
        onTap: changeColor,
      ),
    );
  }

  void changeColor() {
    setState(() {
      color = AppColors.light["secondary"];
    });
  }

  void changeOrderStatus(String status) {
    final controller = ref.read(ordersControllerProvider.notifier);
    controller.changeOrderStatus(
      order: widget.order,
      status: status,
      context: context,
    );
    if (status == "Accepted") {
      setState(() {
        color = AppColors.light["primary"];
      });
    } else if (status == "Rejected") {
      setState(() {
        color = AppColors.light["secondary"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ViewUserScreen(
            user: widget.order.user,
          ),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
        ),
        width: double.infinity,
        height: 150.h,
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
        child: Column(
          children: [
            Container(
              height: 100.h,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(widget.order.meal.menuItem.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.order.meal.menuItem.name,
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
                            "#${widget.order.id}",
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
                            timeAgoSinceDate(widget.order.dateCreated),
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
                  widget.order.status != "Sent to Restaurant"
                      ? const SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 35.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: AppColors.light["primary"],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: () => changeOrderStatus("Accepted"),
                                icon: const Icon(
                                  Icons.check,
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
                                onPressed: showDialogHandler,
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
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
                  color: color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                    Text(widget.order.user.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        )),
                    const SizedBox()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
