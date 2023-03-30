import 'package:akalne/recipient/features/homeMenu/screens/restaurant_page.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/back_button.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/food_image_favorite.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/restaurant_logo.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({
    super.key,
    required this.foodDetails,
    required this.restaurantDetails,
    this.isFavorite = false,
    this.isReplace = false,
  });

  final Map<String, dynamic> foodDetails;
  final Map<String, dynamic> restaurantDetails;
  final bool isFavorite;
  final bool isReplace;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBackButton(),
              const SizedBox(height: 20),
              Column(
                children: [
                  FoodImageFavorite(
                    foodImage: widget.foodDetails['foodImage'],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget.foodDetails['foodName'],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          if (!widget.isReplace) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RestaurantPage(
                                  restaurantDetails: widget.restaurantDetails,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => RestaurantPage(
                                  restaurantDetails: widget.restaurantDetails,
                                ),
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RestaurantLogo(
                              image: widget.restaurantDetails["restaurantLogo"],
                              radius: 15,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.restaurantDetails["restaurantName"],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          const SizedBox(width: 10),
                          Text(
                            count.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                count++;
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.foodDetails["foodDescription"],
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 50,
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
                              const SizedBox(width: 10),
                              Text(
                                "Date Added: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              Text(
                                widget.foodDetails["dateAdded"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 50,
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
                              const SizedBox(width: 10),
                              Text(
                                "Maximum Order: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              Text(
                                widget.foodDetails["maximumOrder"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 50,
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
                                "Distance: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light["primary"],
                                ),
                              ),
                              Text(
                                widget.restaurantDetails["distance"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.light["primary"],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Reserve",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
