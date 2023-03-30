import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/published_meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/app_colors.dart';
import '../../../food/controller/food_controller.dart';

class AddPublishedMealDialog extends ConsumerStatefulWidget {
  final MenuItemModel menuItemModel;
  final String type;
  final int mealCount;
  final PublishedMealModel? publishedMealModel;
  const AddPublishedMealDialog({
    Key? key,
    required this.menuItemModel,
    this.type = "Add",
    this.mealCount = 1,
    this.publishedMealModel,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPublishedMealDialogState();
}

class _AddPublishedMealDialogState
    extends ConsumerState<AddPublishedMealDialog> {
  int count = 1;

  void discard() {
    count = 0;
    Navigator.pop(context);
  }

  void addPublishedMeal() {
    ref.read(foodControllerProvider.notifier).addPublishedMeal(
          menuItem: widget.menuItemModel,
          quantity: count,
          context: context,
        );
  }

  void updatePublishedMeal() {
    ref.read(foodControllerProvider.notifier).updatePublishedMeal(
          meal: widget.publishedMealModel!,
          quantity: count,
          context: context,
        );
  }

  @override
  void initState() {
    super.initState();
    count = widget.mealCount;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(foodControllerProvider);
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      backgroundColor: AppColors.light["background"],
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              foregroundColor: AppColors.light["white"],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
              ),
              title: Text("${widget.type} Available Meal"),
              centerTitle: true,
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Quantity: ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (count > 1) {
                        count--;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: AppColors.light["primary"],
                      ),
                    ),
                    minimumSize: const Size(40, 40),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.remove,
                    color: AppColors.light["primary"],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.light["primary"],
                    shape: CircleBorder(
                      side: BorderSide(
                        color: AppColors.light["primary"],
                      ),
                    ),
                    minimumSize: const Size(40, 40),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            isLoading
                ? const Loader()
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        onPressed: widget.type == "Update"
                            ? updatePublishedMeal
                            : addPublishedMeal,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.light["primary"])),
                        child: Text(
                          widget.type,
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.light["white"],
                          ),
                        ),
                      ),
                      FilledButton(
                          onPressed: discard,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
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
          ],
        ),
      ),
    );
  }
}
