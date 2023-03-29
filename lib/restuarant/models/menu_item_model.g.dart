// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItemModel _$$_MenuItemModelFromJson(Map<String, dynamic> json) =>
    _$_MenuItemModel(
      id: json['id'] as String,
      foodName: json['foodName'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      timeAgo: json['timeAgo'] as String,
      dateAdded: json['dateAdded'] as String,
      maximumOrder: json['maximumOrder'] as int,
      restaurant:
          RestaurantModel.fromJson(json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MenuItemModelToJson(_$_MenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'foodName': instance.foodName,
      'description': instance.description,
      'image': instance.image,
      'timeAgo': instance.timeAgo,
      'dateAdded': instance.dateAdded,
      'maximumOrder': instance.maximumOrder,
      'restaurant': instance.restaurant.toJson(),
    };
