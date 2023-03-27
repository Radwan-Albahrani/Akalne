import 'package:akalne/restuarant/features/orders/screens/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import '../../../../theme/app_colors.dart';

class RestuarantOrdersScreen extends ConsumerStatefulWidget {
  const RestuarantOrdersScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestuarantOrdersScreenState();
}

class _RestuarantOrdersScreenState
    extends ConsumerState<RestuarantOrdersScreen> {
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
                'Orders',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const OrderTile()
          ],
        ),
      ),
    );
  }
}

