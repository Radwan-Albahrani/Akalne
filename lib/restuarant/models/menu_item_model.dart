// ignore_for_file: invalid_annotation_target

import 'package:akalne/recipient/models/restaurant_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  @JsonSerializable(explicitToJson: true)
  factory MenuItemModel({
    required String id,
    required String name,
    required String description,
    required String image,
    required String dateAdded,
    required int maximumOrder,
    required RestaurantModel restaurant,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}
