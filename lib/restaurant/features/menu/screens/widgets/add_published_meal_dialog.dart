import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/app_colors.dart';

class AddPublishedMealDialog extends ConsumerStatefulWidget {
  const AddPublishedMealDialog({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPublishedMealDialogState();
}

class _AddPublishedMealDialogState
    extends ConsumerState<AddPublishedMealDialog> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
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
              title: const Text("Add Available Meal"),
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
