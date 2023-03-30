import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../food_details.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.menuItemModel,
    this.isReplace = false,
  });

  final MenuItemModel menuItemModel;
  final bool isReplace;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isReplace) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodDetails(
                menuItemModel: menuItemModel,
                isReplace: isReplace,
              ),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => FoodDetails(
                menuItemModel: menuItemModel,
                isReplace: isReplace,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(menuItemModel.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuItemModel.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        menuItemModel.restaurant.name as String,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.light["secondaryTransparent"],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            () {
                              final date = menuItemModel.dateAdded;
                              DateTime now = DateTime.now();
                              DateTime dateAdded = DateTime.parse(date);
                              final difference = now.difference(dateAdded);
                              final minutes = difference.inMinutes;
                              final hours = difference.inHours;
                              final days = difference.inDays;
                              if (minutes < 60) {
                                return "$minutes minutes ago";
                              } else if (hours < 24) {
                                return "$hours hours ago";
                              } else {
                                return "$days days ago";
                              }
                            }.call(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.light["secondary"],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.light["primaryTransparent"],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            menuItemModel.restaurant.distance,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.light["primary"],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
