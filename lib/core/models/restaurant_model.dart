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
    required String? restaurantImage,
    required String? restaurantLogo,
    required String? email,
    required bool firstTimeLogin,
    required String distance,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
