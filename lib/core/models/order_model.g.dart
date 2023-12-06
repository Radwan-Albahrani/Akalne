// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as int,
      status: json['status'] as String,
      dateCreated: json['dateCreated'] as String,
      quantity: json['quantity'] as int,
      meal: PublishedMealModel.fromJson(json['meal'] as Map<String, dynamic>),
      restaurantID: json['restaurantID'] as String,
      userId: json['userId'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'dateCreated': instance.dateCreated,
      'quantity': instance.quantity,
      'meal': instance.meal.toJson(),
      'restaurantID': instance.restaurantID,
      'userId': instance.userId,
      'user': instance.user?.toJson(),
      'reason': instance.reason,
    };
