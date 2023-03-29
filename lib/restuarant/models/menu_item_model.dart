import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  factory MenuItemModel({
    required String id,
    required String name,
    required String description,
    required String image,
    required String timeAgo,
    required String dateAdded,
    required int maximumOrder,
    required String restaurantId,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}
