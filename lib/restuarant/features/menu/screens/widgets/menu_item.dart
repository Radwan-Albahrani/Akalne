import 'package:akalne/restuarant/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/material.dart';

import '../../../../../theme/app_colors.dart';
import '../../controller/menu_controller.dart';
import 'add_published_meal_dialog.dart';

class MenuItem extends ConsumerWidget {
  final MenuItemModel menuItemModel;
  const MenuItem({Key? key, required this.menuItemModel}) : super(key: key);

  void showDialogHandler(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => const AddPublishedMealDialog());
  }

  void deleteProduct(WidgetRef ref, BuildContext context) {
    ref
        .read(menuControllerProvider.notifier)
        .deleteProduct(id: menuItemModel.id, context: context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 140.h,
      width: 120.w,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showDialogHandler(context);
            },
            child: Column(
              children: [
                ClipRRect(
                  // only from top right and top left
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    menuItemModel.image,
                    height: 90.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 15.h,
                  child: Text(
                    menuItemModel.name,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
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
                onPressed: () => deleteProduct(ref, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
