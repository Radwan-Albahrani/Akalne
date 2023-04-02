// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/restaurant/features/orders/controller/orders_controller.dart';

import '../../../../../core/common/loader.dart';
import '../../../../../core/features/auth/screens/widgets/rounded_form_field.dart';
import '../../../../../theme/app_colors.dart';

class AddNoteDialog extends ConsumerStatefulWidget {
  OrderModel order;
  // onTap
  void Function() onTap;

  AddNoteDialog({
    Key? key,
    required this.order,
    required this.onTap,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends ConsumerState<AddNoteDialog> {
  final TextEditingController addNoteNoteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    addNoteNoteController.dispose();
  }

  void discard() {
    addNoteNoteController.clear();
    Navigator.pop(context);
  }

  void save() {
    ref.read(ordersControllerProvider.notifier).changeOrderStatus(
          order: widget.order,
          status: "Rejected",
          context: context,
          reason: addNoteNoteController.text.trim(),
        );
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(ordersControllerProvider);
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
              title: const Text("Add Note"),
              centerTitle: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedFormField(
                controller: addNoteNoteController,
                hintText: "Enter your note here",
                label: "Note Description",
                keyboardType: TextInputType.multiline,
                maxLines: 4,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            isLoading
                ? const Loader()
                : Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        onPressed: save,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.light["primary"])),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.light["white"],
                          ),
                        ),
                      ),
                      FilledButton(
                        onPressed: discard,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.light["secondary"],
                          ),
                        ),
                        child: Text(
                          "Discard",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.light["white"],
                          ),
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
