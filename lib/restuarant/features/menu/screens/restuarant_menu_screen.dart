import 'package:akalne/restuarant/features/menu/screens/widgets/menu_item.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';

class RestuarantMenuScreen extends ConsumerStatefulWidget {
  const RestuarantMenuScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestuarantMenuScreenState();
}

class _RestuarantMenuScreenState extends ConsumerState<RestuarantMenuScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text('Hey [Restaurant Name]')),
            const SizedBox(
              height: 10,
            ),
            RoundedSearchField(
              hintText: "Search",
              obscureText: false,
              controller: _searchController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Food Menu',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 140.h,
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 40,
                  ),
                  itemCount: 9,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 120.w, height: 140.h, child: MenuItem());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
