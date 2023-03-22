// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantModel _$$_RestaurantModelFromJson(Map<String, dynamic> json) =>
    _$_RestaurantModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      firstTimeLogin: json['firstTimeLogin'] as bool,
    );

Map<String, dynamic> _$$_RestaurantModelToJson(_$_RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'profilePictureUrl': instance.profilePictureUrl,
      'firstTimeLogin': instance.firstTimeLogin,
    };
