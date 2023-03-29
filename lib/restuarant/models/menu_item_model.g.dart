// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItemModel _$$_MenuItemModelFromJson(Map<String, dynamic> json) =>
    _$_MenuItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      timeAgo: json['timeAgo'] as String,
      dateAdded: json['dateAdded'] as String,
      maximumOrder: json['maximumOrder'] as int,
      restaurantId: json['restaurantId'] as String,
    );

Map<String, dynamic> _$$_MenuItemModelToJson(_$_MenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'timeAgo': instance.timeAgo,
      'dateAdded': instance.dateAdded,
      'maximumOrder': instance.maximumOrder,
      'restaurantId': instance.restaurantId,
    };
