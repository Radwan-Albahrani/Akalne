// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return _RestaurantModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  bool get firstTimeLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantModelCopyWith<RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantModelCopyWith<$Res> {
  factory $RestaurantModelCopyWith(
          RestaurantModel value, $Res Function(RestaurantModel) then) =
      _$RestaurantModelCopyWithImpl<$Res, RestaurantModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      String? phoneNumber,
      String? profilePictureUrl,
      bool firstTimeLogin});
}

/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res, $Val extends RestaurantModel>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? profilePictureUrl = freezed,
    Object? firstTimeLogin = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      firstTimeLogin: null == firstTimeLogin
          ? _value.firstTimeLogin
          : firstTimeLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantModelCopyWith<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  factory _$$_RestaurantModelCopyWith(
          _$_RestaurantModel value, $Res Function(_$_RestaurantModel) then) =
      __$$_RestaurantModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      String? phoneNumber,
      String? profilePictureUrl,
      bool firstTimeLogin});
}

/// @nodoc
class __$$_RestaurantModelCopyWithImpl<$Res>
    extends _$RestaurantModelCopyWithImpl<$Res, _$_RestaurantModel>
    implements _$$_RestaurantModelCopyWith<$Res> {
  __$$_RestaurantModelCopyWithImpl(
      _$_RestaurantModel _value, $Res Function(_$_RestaurantModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? profilePictureUrl = freezed,
    Object? firstTimeLogin = null,
  }) {
    return _then(_$_RestaurantModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      firstTimeLogin: null == firstTimeLogin
          ? _value.firstTimeLogin
          : firstTimeLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantModel implements _RestaurantModel {
  _$_RestaurantModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.profilePictureUrl,
      required this.firstTimeLogin});

  factory _$_RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? profilePictureUrl;
  @override
  final bool firstTimeLogin;

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, profilePictureUrl: $profilePictureUrl, firstTimeLogin: $firstTimeLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.firstTimeLogin, firstTimeLogin) ||
                other.firstTimeLogin == firstTimeLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, phoneNumber,
      profilePictureUrl, firstTimeLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantModelCopyWith<_$_RestaurantModel> get copyWith =>
      __$$_RestaurantModelCopyWithImpl<_$_RestaurantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantModelToJson(
      this,
    );
  }
}

abstract class _RestaurantModel implements RestaurantModel {
  factory _RestaurantModel(
      {required final String? id,
      required final String? name,
      required final String? address,
      required final String? phoneNumber,
      required final String? profilePictureUrl,
      required final bool firstTimeLogin}) = _$_RestaurantModel;

  factory _RestaurantModel.fromJson(Map<String, dynamic> json) =
      _$_RestaurantModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get profilePictureUrl;
  @override
  bool get firstTimeLogin;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantModelCopyWith<_$_RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
