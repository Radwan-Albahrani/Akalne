// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'published_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublishedMealModelImpl _$$PublishedMealModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PublishedMealModelImpl(
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

Map<String, dynamic> _$$PublishedMealModelImplToJson(
        _$PublishedMealModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'quantity': instance.quantity,
      'id': instance.id,
      'menuItem': instance.menuItem.toJson(),
      'restaurantInfo': instance.restaurantInfo?.toJson(),
    };
