import 'package:akalne/restuarant/features/food/screens/widgets/published_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import '../../../../theme/app_colors.dart';

class PublishedMealsScreen extends ConsumerStatefulWidget {
  const PublishedMealsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PublishedMealsScreenState();
}

class _PublishedMealsScreenState extends ConsumerState<PublishedMealsScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Hey [Restaurant Name]')),
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
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 140.h,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/food.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 200.w,
                              child: Text(
                                "Many People are waiting for you !",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  "Help Them now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "published meals",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PublishedMeal(),
              const PublishedMeal(),
              
            ],
          ),
        ),
      );
    
    ;
  }
}