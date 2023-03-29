import 'dart:io';

import 'package:akalne/restuarant/features/menu/controller/menu_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/features/auth/screens/widgets/rounded_form_field.dart';
import '../../../../../core/utils.dart';
import '../../../../../theme/app_colors.dart';

class AddDialog extends ConsumerStatefulWidget {
  const AddDialog({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddDialogState();
}

class _AddDialogState extends ConsumerState<AddDialog> {
  late final TextEditingController addProductProductName;
  late final TextEditingController addProductProductDescription;
  late final TextEditingController addProductProductMaxQuantity;

  File? productImage;

  @override
  void initState() {
    super.initState();
    addProductProductName = TextEditingController();
    addProductProductDescription = TextEditingController();
    addProductProductMaxQuantity = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    addProductProductName.dispose();
    addProductProductDescription.dispose();
    addProductProductMaxQuantity.dispose();
  }

  void selectProductImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        productImage = File(res.files.first.path!);
      });
    }
  }

  void addProduct() {
    if (addProductProductName.text.isEmpty) {
      showSnackBar(context, "Product name is required");
      return;
    }

    if (addProductProductDescription.text.isEmpty) {
      showSnackBar(context, "Product description is required");
      return;
    }

    if (addProductProductMaxQuantity.text.isEmpty) {
      showSnackBar(context, "Product max quantity is required");
      return;
    }

    if (productImage == null) {
      showSnackBar(context, "Product image is required");
      return;
    }
    print("add product");
    ref.read(menuControllerProvider.notifier).addProduct(
        productName: addProductProductName.text.trim(),
        ProductMaxQuantity: addProductProductMaxQuantity.text.trim(),
        Description: addProductProductDescription.text.trim(),
        productImage: productImage!,
        context: context);
  }

  void discard() {
    addProductProductName.clear();
    addProductProductDescription.clear();
    addProductProductMaxQuantity.clear();
    productImage = null;
    Navigator.pop(context);
  }

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
              title: const Text("Add Product"),
              centerTitle: true,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: selectProductImage,
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        child: SizedBox(
                          width: 200.w,
                          child: DottedBorder(
                            dashPattern: const [5, 10],
                            strokeWidth: 3.0,
                            padding: const EdgeInsets.all(10),
                            child: productImage != null
                                ? Center(
                                    child: SizedBox(
                                      height: 100.h,
                                      width: 200.w,
                                      child: Image.file(
                                        productImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Icon(
                                      Icons.image_search,
                                      color: AppColors.light["black"],
                                      size: 70,
                                    ),
                                  ),
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
                    RoundedFormField(
                      controller: addProductProductMaxQuantity,
                      hintText: "3",
                      label: "Product Max Quantity",
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                          onPressed: addProduct,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.light["primary"])),
                          child: Text(
                            "Save",
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
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
