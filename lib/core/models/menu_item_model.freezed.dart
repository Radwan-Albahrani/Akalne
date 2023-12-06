// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) {
  return _MenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get dateAdded => throw _privateConstructorUsedError;
  int get maximumOrder => throw _privateConstructorUsedError;
  RestaurantModel get restaurant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemModelCopyWith<MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemModelCopyWith<$Res> {
  factory $MenuItemModelCopyWith(
          MenuItemModel value, $Res Function(MenuItemModel) then) =
      _$MenuItemModelCopyWithImpl<$Res, MenuItemModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String image,
      String dateAdded,
      int maximumOrder,
      RestaurantModel restaurant});

  $RestaurantModelCopyWith<$Res> get restaurant;
}

/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res, $Val extends MenuItemModel>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? dateAdded = null,
    Object? maximumOrder = null,
    Object? restaurant = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String,
      maximumOrder: null == maximumOrder
          ? _value.maximumOrder
          : maximumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurant: null == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as RestaurantModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestaurantModelCopyWith<$Res> get restaurant {
    return $RestaurantModelCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuItemModelImplCopyWith<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  factory _$$MenuItemModelImplCopyWith(
          _$MenuItemModelImpl value, $Res Function(_$MenuItemModelImpl) then) =
      __$$MenuItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String image,
      String dateAdded,
      int maximumOrder,
      RestaurantModel restaurant});

  @override
  $RestaurantModelCopyWith<$Res> get restaurant;
}

/// @nodoc
class __$$MenuItemModelImplCopyWithImpl<$Res>
    extends _$MenuItemModelCopyWithImpl<$Res, _$MenuItemModelImpl>
    implements _$$MenuItemModelImplCopyWith<$Res> {
  __$$MenuItemModelImplCopyWithImpl(
      _$MenuItemModelImpl _value, $Res Function(_$MenuItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? dateAdded = null,
    Object? maximumOrder = null,
    Object? restaurant = null,
  }) {
    return _then(_$MenuItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String,
      maximumOrder: null == maximumOrder
          ? _value.maximumOrder
          : maximumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurant: null == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as RestaurantModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MenuItemModelImpl implements _MenuItemModel {
  _$MenuItemModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.dateAdded,
      required this.maximumOrder,
      required this.restaurant});

  factory _$MenuItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  @override
  final String dateAdded;
  @override
  final int maximumOrder;
  @override
  final RestaurantModel restaurant;

  @override
  String toString() {
    return 'MenuItemModel(id: $id, name: $name, description: $description, image: $image, dateAdded: $dateAdded, maximumOrder: $maximumOrder, restaurant: $restaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.maximumOrder, maximumOrder) ||
                other.maximumOrder == maximumOrder) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image,
      dateAdded, maximumOrder, restaurant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemModelImplCopyWith<_$MenuItemModelImpl> get copyWith =>
      __$$MenuItemModelImplCopyWithImpl<_$MenuItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemModelImplToJson(
      this,
    );
  }
}

abstract class _MenuItemModel implements MenuItemModel {
  factory _MenuItemModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String image,
      required final String dateAdded,
      required final int maximumOrder,
      required final RestaurantModel restaurant}) = _$MenuItemModelImpl;

  factory _MenuItemModel.fromJson(Map<String, dynamic> json) =
      _$MenuItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  String get dateAdded;
  @override
  int get maximumOrder;
  @override
  RestaurantModel get restaurant;
  @override
  @JsonKey(ignore: true)
  _$$MenuItemModelImplCopyWith<_$MenuItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
