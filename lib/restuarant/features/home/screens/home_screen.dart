import 'package:akalne/core/features/auth/screens/widgets/rounded_form_field.dart';
import 'package:akalne/recipient/features/Profile/screens/profile_screen.dart';
import 'package:akalne/restuarant/features/food/screens/published_meals_screen.dart';
import 'package:akalne/restuarant/features/orders/screens/restuarant_orders_screen.dart';
import 'package:akalne/restuarant/features/profile/screens/profile_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../theme/app_colors.dart';
import '../../menu/screens/restuarant_menu_screen.dart';

class RestaurantHomeScreen extends ConsumerStatefulWidget {
  const RestaurantHomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<RestaurantHomeScreen> {
  var _selectedIndex = 0;

  var screens = [
    const PublishedMealsScreen(),
    const RestuarantMenuScreen(),
    const RestuarantOrdersScreen(),
    const RestuarantProfileScreen(),
  ];
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  late final TextEditingController addProductProductName;
  late final TextEditingController addProductProductDescription;

  @override
  void initState() {
    // For the `Add Product` dialog
    addProductProductName = TextEditingController();
    addProductProductDescription = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    addProductProductName.dispose();
    addProductProductDescription.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 70.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            gap: 16,
            activeColor: AppColors.light['primary'],
            color: Colors.grey[400]!,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: AppColors.light['primaryTransparent'],
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                iconSize: 35,
              ),
              GButton(
                icon: Icons.restaurant_menu_sharp,
                iconSize: 35,
              ),
              GButton(
                icon: Icons.shopping_basket_outlined,
                iconSize: 35,
              ),
              GButton(
                icon: Icons.person_outline,
                iconSize: 35,
              ),
            ],
            selectedIndex: 0,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: AppColors.light['primary'],
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        backgroundColor: AppColors.light["background"],
                        child: SingleChildScrollView(
                          child: Column(children: [
                            AppBar(
                              foregroundColor:
                                  AppColors.light["white"],
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30.0),
                                    topLeft: Radius.circular(30.0)),
                              ),
                              title: const Text("Add Product"),
                              centerTitle: true,
                            ),
                            Form(
                                child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        // TODO: Show image picker.
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  AppColors.light["white"])),
                                      child: DottedBorder(
                                        dashPattern: const [5, 10],
                                        strokeWidth: 3.0,
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.image_search,
                                          color: AppColors.light["background"],
                                          size: 70,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  RoundedFormField(
                                    controller: addProductProductName,
                                    hintText: "Spacy fresh crab",
                                    label: "Product name",
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  RoundedFormField(
                                    controller: addProductProductDescription,
                                    hintText: "Spacy fresh crab",
                                    label: "Product Description",
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FilledButton(
                                        onPressed: () {
                                          // TODO: Implement save product and close dialog and keyboard.
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColors
                                                        .light["primary"])),
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: AppColors.light["white"],
                                          ),
                                        ),
                                      ),
                                      FilledButton(
                                          onPressed: () {
                                            // TODO: Clearn data and close dialog and keyboard.
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors
                                                          .light["secondary"])),
                                          child: Text(
                                            "Discard",
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: AppColors.light["white"],
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ]),
                        )));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
