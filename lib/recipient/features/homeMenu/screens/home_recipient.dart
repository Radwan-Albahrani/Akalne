import 'package:akalne/recipient/features/homeMenu/screens/widgets/food_item_card.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/toggle_switch.dart';
import 'package:akalne/recipient/models/user_model.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_up/switch_up.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';

class HomeRecipient extends ConsumerStatefulWidget {
  const HomeRecipient({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeRecipientState();
}

class _HomeRecipientState extends ConsumerState<HomeRecipient> {
  UserModel? userModel;

  @override
  void initState() {
    userModel = ref.read(userProvider);
    super.initState();
  }

  final _searchController = TextEditingController();

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
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hey ${userModel!.name}!",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RoundedSearchField(
                    hintText: "Search",
                    obscureText: false,
                    controller: _searchController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Available Meals",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ToggleSwitch(
                    items: const ["Near Me", "Recent"],
                    onChanged: (value) {
                      print('switched to: $value');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return FoodItemCard(
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
