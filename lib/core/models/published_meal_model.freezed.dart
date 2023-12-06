// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'published_meal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublishedMealModel _$PublishedMealModelFromJson(Map<String, dynamic> json) {
  return _PublishedMealModel.fromJson(json);
}

/// @nodoc
mixin _$PublishedMealModel {
  String get createdAt => throw _privateConstructorUsedError;
  set createdAt(String value) => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  set quantity(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  MenuItemModel get menuItem => throw _privateConstructorUsedError;
  set menuItem(MenuItemModel value) => throw _privateConstructorUsedError;
  RestaurantModel? get restaurantInfo => throw _privateConstructorUsedError;
  set restaurantInfo(RestaurantModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublishedMealModelCopyWith<PublishedMealModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublishedMealModelCopyWith<$Res> {
  factory $PublishedMealModelCopyWith(
          PublishedMealModel value, $Res Function(PublishedMealModel) then) =
      _$PublishedMealModelCopyWithImpl<$Res, PublishedMealModel>;
  @useResult
  $Res call(
      {String createdAt,
      int quantity,
      String id,
      MenuItemModel menuItem,
      RestaurantModel? restaurantInfo});

  $MenuItemModelCopyWith<$Res> get menuItem;
  $RestaurantModelCopyWith<$Res>? get restaurantInfo;
}

/// @nodoc
class _$PublishedMealModelCopyWithImpl<$Res, $Val extends PublishedMealModel>
    implements $PublishedMealModelCopyWith<$Res> {
  _$PublishedMealModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? quantity = null,
    Object? id = null,
    Object? menuItem = null,
    Object? restaurantInfo = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
      restaurantInfo: freezed == restaurantInfo
          ? _value.restaurantInfo
          : restaurantInfo // ignore: cast_nullable_to_non_nullable
              as RestaurantModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuItemModelCopyWith<$Res> get menuItem {
    return $MenuItemModelCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RestaurantModelCopyWith<$Res>? get restaurantInfo {
    if (_value.restaurantInfo == null) {
      return null;
    }

    return $RestaurantModelCopyWith<$Res>(_value.restaurantInfo!, (value) {
      return _then(_value.copyWith(restaurantInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PublishedMealModelImplCopyWith<$Res>
    implements $PublishedMealModelCopyWith<$Res> {
  factory _$$PublishedMealModelImplCopyWith(_$PublishedMealModelImpl value,
          $Res Function(_$PublishedMealModelImpl) then) =
      __$$PublishedMealModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdAt,
      int quantity,
      String id,
      MenuItemModel menuItem,
      RestaurantModel? restaurantInfo});

  @override
  $MenuItemModelCopyWith<$Res> get menuItem;
  @override
  $RestaurantModelCopyWith<$Res>? get restaurantInfo;
}

/// @nodoc
class __$$PublishedMealModelImplCopyWithImpl<$Res>
    extends _$PublishedMealModelCopyWithImpl<$Res, _$PublishedMealModelImpl>
    implements _$$PublishedMealModelImplCopyWith<$Res> {
  __$$PublishedMealModelImplCopyWithImpl(_$PublishedMealModelImpl _value,
      $Res Function(_$PublishedMealModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? quantity = null,
    Object? id = null,
    Object? menuItem = null,
    Object? restaurantInfo = freezed,
  }) {
    return _then(_$PublishedMealModelImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItemModel,
      restaurantInfo: freezed == restaurantInfo
          ? _value.restaurantInfo
          : restaurantInfo // ignore: cast_nullable_to_non_nullable
              as RestaurantModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PublishedMealModelImpl implements _PublishedMealModel {
  _$PublishedMealModelImpl(
      {required this.createdAt,
      required this.quantity,
      required this.id,
      required this.menuItem,
      this.restaurantInfo});

  factory _$PublishedMealModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublishedMealModelImplFromJson(json);

  @override
  String createdAt;
  @override
  int quantity;
  @override
  String id;
  @override
  MenuItemModel menuItem;
  @override
  RestaurantModel? restaurantInfo;

  @override
  String toString() {
    return 'PublishedMealModel(createdAt: $createdAt, quantity: $quantity, id: $id, menuItem: $menuItem, restaurantInfo: $restaurantInfo)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishedMealModelImplCopyWith<_$PublishedMealModelImpl> get copyWith =>
      __$$PublishedMealModelImplCopyWithImpl<_$PublishedMealModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublishedMealModelImplToJson(
      this,
    );
  }
}

abstract class _PublishedMealModel implements PublishedMealModel {
  factory _PublishedMealModel(
      {required String createdAt,
      required int quantity,
      required String id,
      required MenuItemModel menuItem,
      RestaurantModel? restaurantInfo}) = _$PublishedMealModelImpl;

  factory _PublishedMealModel.fromJson(Map<String, dynamic> json) =
      _$PublishedMealModelImpl.fromJson;

  @override
  String get createdAt;
  set createdAt(String value);
  @override
  int get quantity;
  set quantity(int value);
  @override
  String get id;
  set id(String value);
  @override
  MenuItemModel get menuItem;
  set menuItem(MenuItemModel value);
  @override
  RestaurantModel? get restaurantInfo;
  set restaurantInfo(RestaurantModel? value);
  @override
  @JsonKey(ignore: true)
  _$$PublishedMealModelImplCopyWith<_$PublishedMealModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
