// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantModelImpl _$$RestaurantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      restaurantImage: json['restaurantImage'] as String?,
      restaurantLogo: json['restaurantLogo'] as String?,
      email: json['email'] as String?,
      firstTimeLogin: json['firstTimeLogin'] as bool,
      distance: json['distance'] as String,
    );

Map<String, dynamic> _$$RestaurantModelImplToJson(
        _$RestaurantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'restaurantImage': instance.restaurantImage,
      'restaurantLogo': instance.restaurantLogo,
      'email': instance.email,
      'firstTimeLogin': instance.firstTimeLogin,
      'distance': instance.distance,
    };
