import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/material.dart';

import '../../../../../theme/app_colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 152.h,
      width: 120.w,
      child: Column(
        children: [
          TextButton(
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
                            foregroundColor: AppColors.light["white"],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0)),
                            ),
                            title: const Text("Add Available Meal"),
                            centerTitle: true,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SpinBox(
                            min: 1,
                            step: 1,
                            incrementIcon: Icon(Icons.add_circle),
                            decrementIcon: Icon(Icons.remove_circle),
                            iconSize: 30,
                            textStyle: TextStyle(fontSize: 30),
                            onChanged: (value) {
                              // TODO: Add state to widget and save value.
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FilledButton(
                                onPressed: () {
                                  // TODO: Implement `add meal` and close dialog and keyboard.
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.light["primary"])),
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: AppColors.light["white"],
                                  ),
                                ),
                              ),
                              FilledButton(
                                  onPressed: () {
                                    // TODO: Clean data and close dialog and keyboard.
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.light["secondary"])),
                                  child: Text(
                                    "Discard",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: AppColors.light["white"],
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ]))));
              },
              child: Column(
                children: [
                  ClipRRect(
                    // only from top right and top left
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/food.png",
                      height: 90.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 15.h,
                    child: Text(
                      'Food Name ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              )),
          Container(
            height: 28.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.light["secondary"],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
