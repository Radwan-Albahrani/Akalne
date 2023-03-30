import 'package:akalne/core/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../core/models/published_meal_model.dart';

import '../../../../core/utils.dart';
import '../repository/food_repository.dart';

final foodControllerProvider = StateNotifierProvider<FoodController, bool>(
  (ref) => FoodController(
    foodRepository: ref.watch(foodRepositoryProvider),
    ref: ref,
  ),
);

final publishedMealsProvider = StreamProvider((ref) {
  final controller = ref.watch(foodControllerProvider.notifier);
  return controller.getPublishedMealsByRestaurantID();
});

class FoodController extends StateNotifier<bool> {
  final FoodRepository _foodRepository;
  final Ref _ref;

  FoodController({
    required FoodRepository foodRepository,
    required Ref ref,
  })  : _foodRepository = foodRepository,
        _ref = ref,
        super(false);

  void addPublishedMeal(
      {required MenuItemModel menuItem,
      required int quantity,
      required BuildContext context}) async {
    state = true;
    const uuid = Uuid();

    PublishedMealModel meal = PublishedMealModel(
      id: uuid.v4(),
      menuItem: menuItem,
      quantity: quantity,
      createdAt: DateTime.now().toString(),
    );

    final res = await _foodRepository.addPublishedMeal(meal);
    state = false;

    res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => {
              showSuccesSnackBar(context, "Meal added successfully"),
              Navigator.pop(context),
            });
  }

  Stream<List<PublishedMealModel>> getPublishedMealsByRestaurantID() {
    final id = _ref.read(restaurantProvider)!.id ?? "";
    return _foodRepository.getPublishedMealsByRestaurantID(id);
  }
}
