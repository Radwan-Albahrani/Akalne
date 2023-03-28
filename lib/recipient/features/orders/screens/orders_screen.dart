import 'package:akalne/recipient/features/homeMenu/screens/widgets/back_button.dart';
import 'package:akalne/recipient/features/orders/screens/widgets/order_item_card.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  var dummyData = [
    [
      {
        "foodName": "Chicken",
        "foodImage": "assets/images/chicken.jpg",
        "timeAgo": "5 mins ago",
        "foodDescription": "Chicken slices with a side of fries and a drink",
        "dateAdded": "2021-09-01 12:00:00",
        "maximumOrder": "5",
      },
      {
        "restaurantName": "McDonalds",
        "restaurantImage": "assets/images/chicken.jpg",
        "restaurantLogo": "assets/images/McDonald's Logo.png",
        "distance": "1.2 km",
      },
    ],
    [
      {
        "foodName": "Chicken",
        "foodImage": "assets/images/chicken.jpg",
        "timeAgo": "5 mins ago",
        "foodDescription": "Chicken slices with a side of fries and a drink",
        "dateAdded": "2021-09-01 12:00:00",
        "maximumOrder": "5",
      },
      {
        "restaurantName": "McDonalds",
        "restaurantImage": "assets/images/chicken.jpg",
        "restaurantLogo": "assets/images/McDonald's Logo.png",
        "distance": "1.2 km",
      },
    ],
    [
      {
        "foodName": "Chicken",
        "foodImage": "assets/images/chicken.jpg",
        "timeAgo": "5 mins ago",
        "foodDescription": "Chicken slices with a side of fries and a drink",
        "dateAdded": "2021-09-01 12:00:00",
        "maximumOrder": "5",
      },
      {
        "restaurantName": "McDonalds",
        "restaurantImage": "assets/images/chicken.jpg",
        "restaurantLogo": "assets/images/McDonald's Logo.png",
        "distance": "1.2 km",
      },
    ],
    [
      {
        "foodName": "Chicken",
        "foodImage": "assets/images/chicken.jpg",
        "timeAgo": "5 mins ago",
        "foodDescription": "Chicken slices with a side of fries and a drink",
        "dateAdded": "2021-09-01 12:00:00",
        "maximumOrder": "5",
      },
      {
        "restaurantName": "McDonalds",
        "restaurantImage": "assets/images/chicken.jpg",
        "restaurantLogo": "assets/images/McDonald's Logo.png",
        "distance": "1.2 km",
      },
    ],
    [
      {
        "foodName": "Chicken",
        "foodImage": "assets/images/chicken.jpg",
        "timeAgo": "5 mins ago",
        "foodDescription": "Chicken slices with a side of fries and a drink",
        "dateAdded": "2021-09-01 12:00:00",
        "maximumOrder": "5",
      },
      {
        "restaurantName": "McDonalds",
        "restaurantImage": "assets/images/chicken.jpg",
        "restaurantLogo": "assets/images/McDonald's Logo.png",
        "distance": "1.2 km",
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, bottom: 10, top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "My Orders",
                        style: TextStyle(
                          fontSize: 28,
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
                  return OrderItemCard(
                    foodDetails: dummyData[index][0],
                    restaurantDetails: dummyData[index][1],
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
