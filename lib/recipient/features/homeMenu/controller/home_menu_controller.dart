import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/recipient/features/homeMenu/repository/home_menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeMenuControllerProvider =
    StateNotifierProvider<HomeMenuController, bool>((ref) => HomeMenuController(
          ref: ref,
          homeMenuRepository: ref.watch(homeMenuRepositoryProvider),
        ));

final menuItemsProvider = StreamProvider((ref) {
  final controller = ref.watch(homeMenuControllerProvider.notifier);
  return controller.getMenuItems();
});

class HomeMenuController extends StateNotifier<bool> {
  final Ref _ref;
  final HomeMenuRepository _homeMenuRepository;
  HomeMenuController({
    required Ref ref,
    required HomeMenuRepository homeMenuRepository,
  })  : _ref = ref,
        _homeMenuRepository = homeMenuRepository,
        super(false);

  Stream<List<PublishedMealModel>> getMenuItems() {
    return _homeMenuRepository.getMenuItems();
  }

  Future<List<PublishedMealModel>> getMenuItemsByID(String id) async {
    return _homeMenuRepository.getMenuItemsByID(id);
  }
}
