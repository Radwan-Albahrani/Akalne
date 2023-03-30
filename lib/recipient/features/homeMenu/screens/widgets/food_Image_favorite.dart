import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';

class FoodImageFavorite extends StatefulWidget {
  const FoodImageFavorite({
    super.key,
    required this.foodImage,
  });

  final String foodImage;

  @override
  State<FoodImageFavorite> createState() => _FoodImageFavoriteState();
}

class _FoodImageFavoriteState extends State<FoodImageFavorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(widget.foodImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.light["primaryTransparent"],
              ),
              shape: MaterialStateProperty.all(
                CircleBorder(
                  side: BorderSide(
                    color: AppColors.light["primary"],
                  ),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(40, 40),
              ),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
