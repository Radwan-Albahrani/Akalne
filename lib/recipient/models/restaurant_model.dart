import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  factory RestaurantModel({
    required String? id,
    required String? name,
    required String? address,
    required String? phoneNumber,
    required String? profilePictureUrl,
    required bool firstTimeLogin,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
