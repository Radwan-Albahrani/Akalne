import 'package:flutter/material.dart';

class RestaurantLogo extends StatefulWidget {
  const RestaurantLogo({
    super.key,
    required this.image,
    required this.radius,
  });

  final String image;
  final double radius;

  @override
  State<RestaurantLogo> createState() => _RestaurantLogoState();
}

class _RestaurantLogoState extends State<RestaurantLogo> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(widget.radius / 3),
        child: Image(
          image: AssetImage(
            widget.image,
          ),
        ),
      ),
    );
  }
}
