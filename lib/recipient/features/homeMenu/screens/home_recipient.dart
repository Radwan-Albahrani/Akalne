import 'package:akalne/recipient/features/homeMenu/screens/widgets/food_item_card.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/toggle_switch.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:switch_up/switch_up.dart';

class HomeRecipient extends StatefulWidget {
  const HomeRecipient({super.key});

  @override
  State<HomeRecipient> createState() => _HomeRecipientState();
}

class _HomeRecipientState extends State<HomeRecipient> {
  final _searchController = TextEditingController();

  var dummyData = [
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    },
    {
      "foodName": "Chicken",
      "foodImage": "assets/images/chicken.png",
      "restaurantName": "McDonalds",
      "timeAgo": "5 mins ago",
      "distance": "1.2 km",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 24, bottom: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    Text(
                      "Hey [NAME]!",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                  foodName: dummyData[index]["foodName"]!,
                  foodImage: dummyData[index]["foodImage"]!,
                  restaurantName: dummyData[index]["restaurantName"]!,
                  timeAgo: dummyData[index]["timeAgo"]!,
                  distance: dummyData[index]["distance"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
