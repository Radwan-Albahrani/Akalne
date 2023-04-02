import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'published_meal_model.freezed.dart';
part 'published_meal_model.g.dart';

@unfreezed
class PublishedMealModel with _$PublishedMealModel {
  @JsonSerializable(explicitToJson: true)
  factory PublishedMealModel({
    required String createdAt,
    required int quantity,
    required String id,
    required MenuItemModel menuItem,
    RestaurantModel? restaurantInfo,
  }) = _PublishedMealModel;

  factory PublishedMealModel.fromJson(Map<String, dynamic> json) =>
      _$PublishedMealModelFromJson(json);
}
