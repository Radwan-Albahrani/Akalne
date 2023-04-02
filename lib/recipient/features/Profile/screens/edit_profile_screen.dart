import 'dart:io';

import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/constants/app_constants.dart';
import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:akalne/core/utils.dart';
import 'package:akalne/restaurant/features/profile/controller/restaurant_profile_controller.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/user_profile_controller.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  UserModel userModel;
  EditProfileScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  File? profileFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void save() {
    if (_formKey.currentState!.validate()) {
      ref.read(userProfileControllerProvider.notifier).updateUserProfile(
            userName: _nameController.text.trim(),
            userPhone: _phoneNumberController.text,
            userImage: profileFile,
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

  @override
  void initState() {
    super.initState();
    final res = ref.read(userProvider);
    _nameController.text = res!.name;
    _phoneNumberController.text = res.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userProfileControllerProvider);
    final isDefaultImage = widget.userModel.profilePictureUrl! == AppConstants.defaultProfile;
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
                      child: GestureDetector(
                        onTap: selectProfileImage,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: isDefaultImage && profileFile == null? const AssetImage(AppConstants.defaultProfile) :  profileFile != null
                              ? Image.file(profileFile!).image
                              : NetworkImage(
                                  widget.userModel.profilePictureUrl!),
                          radius: 75,
                        ),
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
                              labelText: 'Name',
                              hintText: 'Your Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
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
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
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
