// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:akalne/core/constants/app_constants.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/features/auth/screens/widgets/rounded_form_field.dart';
import '../../../../../recipient/features/homeMenu/screens/widgets/back_button.dart';

class ViewUserScreen extends ConsumerStatefulWidget {
  final UserModel user;

  const ViewUserScreen({
    super.key,
    required this.user,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends ConsumerState<ViewUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    addressController.text = widget.user.email;
    phoneNumberController.text = widget.user.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: const CustomBackButton(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Recipient Details",
          style: TextStyle(fontSize: 25.sp, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile",
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
                  backgroundImage: () {
                    if (widget.user.profilePictureUrl!.contains("default")) {
                      return const AssetImage(AppConstants.defaultProfile);
                    }
                    return NetworkImage(widget.user.profilePictureUrl!);
                  }.call() as ImageProvider),
              SizedBox(
                height: 10.h,
              ),
              RoundedFormField(
                controller: nameController,
                enabled: false,
                hintText: "Recipient name",
              ),
              SizedBox(
                height: 10.h,
              ),
              RoundedFormField(
                controller: addressController,
                hintText: "Recipient Email",
                enabled: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              RoundedFormField(
                controller: phoneNumberController,
                hintText: "Recipient phone number",
                enabled: false,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
