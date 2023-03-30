import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/restaurant_logo.dart';
import 'package:flutter/material.dart';

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
      height: 150,
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
                    radius: 30,
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        widget.restaurantDetails.distance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
