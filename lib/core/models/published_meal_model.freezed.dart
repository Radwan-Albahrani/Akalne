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
  int get quantity => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  MenuItemModel get menuItem => throw _privateConstructorUsedError;

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
      {String createdAt, int quantity, String id, MenuItemModel menuItem});

  $MenuItemModelCopyWith<$Res> get menuItem;
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuItemModelCopyWith<$Res> get menuItem {
    return $MenuItemModelCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PublishedMealModelCopyWith<$Res>
    implements $PublishedMealModelCopyWith<$Res> {
  factory _$$_PublishedMealModelCopyWith(_$_PublishedMealModel value,
          $Res Function(_$_PublishedMealModel) then) =
      __$$_PublishedMealModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdAt, int quantity, String id, MenuItemModel menuItem});

  @override
  $MenuItemModelCopyWith<$Res> get menuItem;
}

/// @nodoc
class __$$_PublishedMealModelCopyWithImpl<$Res>
    extends _$PublishedMealModelCopyWithImpl<$Res, _$_PublishedMealModel>
    implements _$$_PublishedMealModelCopyWith<$Res> {
  __$$_PublishedMealModelCopyWithImpl(
      _$_PublishedMealModel _value, $Res Function(_$_PublishedMealModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? quantity = null,
    Object? id = null,
    Object? menuItem = null,
  }) {
    return _then(_$_PublishedMealModel(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PublishedMealModel implements _PublishedMealModel {
  _$_PublishedMealModel(
      {required this.createdAt,
      required this.quantity,
      required this.id,
      required this.menuItem});

  factory _$_PublishedMealModel.fromJson(Map<String, dynamic> json) =>
      _$$_PublishedMealModelFromJson(json);

  @override
  final String createdAt;
  @override
  final int quantity;
  @override
  final String id;
  @override
  final MenuItemModel menuItem;

  @override
  String toString() {
    return 'PublishedMealModel(createdAt: $createdAt, quantity: $quantity, id: $id, menuItem: $menuItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublishedMealModel &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItem, menuItem) ||
                other.menuItem == menuItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, createdAt, quantity, id, menuItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublishedMealModelCopyWith<_$_PublishedMealModel> get copyWith =>
      __$$_PublishedMealModelCopyWithImpl<_$_PublishedMealModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublishedMealModelToJson(
      this,
    );
  }
}

abstract class _PublishedMealModel implements PublishedMealModel {
  factory _PublishedMealModel(
      {required final String createdAt,
      required final int quantity,
      required final String id,
      required final MenuItemModel menuItem}) = _$_PublishedMealModel;

  factory _PublishedMealModel.fromJson(Map<String, dynamic> json) =
      _$_PublishedMealModel.fromJson;

  @override
  String get createdAt;
  @override
  int get quantity;
  @override
  String get id;
  @override
  MenuItemModel get menuItem;
  @override
  @JsonKey(ignore: true)
  _$$_PublishedMealModelCopyWith<_$_PublishedMealModel> get copyWith =>
      throw _privateConstructorUsedError;
}
