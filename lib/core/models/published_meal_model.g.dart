// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'published_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublishedMealModel _$$_PublishedMealModelFromJson(
        Map<String, dynamic> json) =>
    _$_PublishedMealModel(
      createdAt: json['createdAt'] as String,
      quantity: json['quantity'] as int,
      id: json['id'] as String,
      menuItem:
          MenuItemModel.fromJson(json['menuItem'] as Map<String, dynamic>),
      restaurantInfo: json['restaurantInfo'] == null
          ? null
          : RestaurantModel.fromJson(
              json['restaurantInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PublishedMealModelToJson(
        _$_PublishedMealModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'quantity': instance.quantity,
      'id': instance.id,
      'menuItem': instance.menuItem.toJson(),
      'restaurantInfo': instance.restaurantInfo?.toJson(),
    };
