// ignore_for_file: invalid_annotation_target

import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  @JsonSerializable(explicitToJson: true)
  factory OrderModel({
    required int id,
    required String status,
    required String dateCreated,
    required int quantity,
    required PublishedMealModel meal,
    required String restaurantID,
    required String userId,
    UserModel? user,
    String? reason,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
