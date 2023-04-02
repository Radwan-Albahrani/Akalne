import 'dart:io';

import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/core/utils.dart';
import 'package:akalne/restaurant/features/profile/controller/restaurant_profile_controller.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditRestaurantProfileScreen extends ConsumerStatefulWidget {
  RestaurantModel restaurantModel;
  EditRestaurantProfileScreen({
    Key? key,
    required this.restaurantModel,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditRestaurantProfileScreenState();
}

class _EditRestaurantProfileScreenState
    extends ConsumerState<EditRestaurantProfileScreen> {
  File? bannerFile;
  File? profileFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void save() {
    // if (bannerFile == null) {
    //   showSnackBar(context, 'Please select banner image');
    //   return;
    // }

    // if (profileFile == null) {
    //   showSnackBar(context, 'Please select profile image');
    //   return;
    // }

    if (_formKey.currentState!.validate()) {
      ref
          .read(restaurantProfileControllerProvider.notifier)
          .updateRestaurantProfile(
            restaurantName: _nameController.text.trim(),
            restaurantAddress: _addressController.text.trim(),
            restaurantPhone: _phoneNumberController.text,
            restaurantLogo: profileFile,
            restaurantImage: bannerFile,
            context: context,
          );
    }
  }

  void selectProfileImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        profileFile = File(res.files.first.path!);
      });
    }
  }

  void selectBannerImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        bannerFile = File(res.files.first.path!);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final res = ref.read(restaurantProvider);
    _nameController.text = res!.name!;
    _addressController.text = res.address!;
    _phoneNumberController.text = res.phoneNumber!;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(restaurantProfileControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Edit Restaurant Profile',
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: save,
            child: Text(
              'Save',
              style: TextStyle(
                color: AppColors.light["primary"],
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: selectBannerImage,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              color: Colors.grey,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: bannerFile != null
                                    ? Image.file(bannerFile!)
                                    : Image.network(widget
                                        .restaurantModel.restaurantImage!),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: GestureDetector(
                                onTap: selectProfileImage,
                                child: CircleAvatar(
                                  backgroundImage: profileFile != null
                                      ? Image.file(profileFile!).image
                                      : NetworkImage(widget
                                          .restaurantModel.restaurantLogo!),
                                  radius: 32,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Restaurant Name',
                              hintText: 'Restaurant Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter restaurant name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              hintText: 'Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              hintText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
