// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/restaurant_model.dart';

import '../../../../core/features/auth/screens/widgets/rounded_form_field.dart';
import '../../../../recipient/features/homeMenu/screens/widgets/back_button.dart';

class EditResturantScreen extends ConsumerStatefulWidget {
  final RestaurantModel restaurant;

  const EditResturantScreen({
    super.key,
    required this.restaurant,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditResturantScreenState();
}

class _EditResturantScreenState extends ConsumerState<EditResturantScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.restaurant.name!;
    addressController.text = widget.restaurant.address!;
    phoneNumberController.text = widget.restaurant.phoneNumber!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            margin: EdgeInsets.only(left: 10), child: const CustomBackButton()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "My Account",
          style: TextStyle(fontSize: 25.sp, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Restaurant banner",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 100.h,
              width: 200.w,
              child: DottedBorder(
                dashPattern: const [5, 10],
                strokeWidth: 3.0,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Image.network(
                    widget.restaurant.restaurantImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Restaurant logo",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 75,
              backgroundImage: NetworkImage(widget.restaurant.restaurantImage!),
            ),
            SizedBox(
              height: 10.h,
            ),
            RoundedFormField(
              controller: nameController,
              hintText: "Restaurant name",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Restaurant name";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            RoundedFormField(
              controller: addressController,
              hintText: "Restaurant address",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Restaurant address";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            RoundedFormField(
              controller: phoneNumberController,
              hintText: "Restaurant phone number",

              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Restaurant phone number";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () => {},
                child:
                    Text("Save", style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
