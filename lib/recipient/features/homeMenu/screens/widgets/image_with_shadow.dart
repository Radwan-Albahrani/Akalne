import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/restaurant_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWithShadow extends StatefulWidget {
  const ImageWithShadow({
    super.key,
    required this.restaurantDetails,
  });

  final RestaurantModel restaurantDetails;

  @override
  State<ImageWithShadow> createState() => _ImageWithShadowState();
}

class _ImageWithShadowState extends State<ImageWithShadow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image:
              NetworkImage(widget.restaurantDetails.restaurantImage as String),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RestaurantLogo(
                    image: widget.restaurantDetails.restaurantLogo as String,
                    radius: 30.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.restaurantDetails.name as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      Container(
                        width: 270.w,
                        constraints: BoxConstraints(
                          maxWidth: 270.w,
                          minHeight: 20.h,
                          maxHeight: 40.h,
                        ),
                        child: Flexible(
                          child: Text(
                            widget.restaurantDetails.address as String,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}
