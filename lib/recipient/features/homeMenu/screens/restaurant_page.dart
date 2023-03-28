import 'package:akalne/recipient/features/homeMenu/screens/widgets/back_button.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/food_item_card.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/image_with_shadow.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({
    super.key,
    required this.restaurantDetails,
  });

  final Map<String, dynamic> restaurantDetails;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  var dummyData = [
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.jpg",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
      "foodDescription": "Chicken slices with a side of fries and a drink",
      "dateAdded": "2021-09-01 12:00:00",
      "maximumOrder": "5",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.jpg",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
      "foodDescription": "Chicken slices with a side of fries and a drink",
      "dateAdded": "2021-09-01 12:00:00",
      "maximumOrder": "5",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.jpg",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
      "foodDescription": "Chicken slices with a side of fries and a drink",
      "dateAdded": "2021-09-01 12:00:00",
      "maximumOrder": "5",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 32, left: 32),
              child: Column(
                children: [
                  const CustomBackButton(),
                  const SizedBox(height: 10),
                  ImageWithShadow(
                    restaurantDetails: widget.restaurantDetails,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        "Available Meals",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return FoodItemCard(
                    foodDetails: dummyData[index],
                    restaurantDetails: widget.restaurantDetails,
                    isReplace: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
