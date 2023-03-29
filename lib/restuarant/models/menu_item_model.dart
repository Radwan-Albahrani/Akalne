import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  factory MenuItemModel({
    required String id,
    required String foodName,
    required String description,
    required String image,
    required String timeAgo,
    required String dateAdded,
    required int maximumOrder,
    required String? restaurantName,
    required String? address,
    required String? phoneNumber,
    required String? restaurantImage,
    required String? restaurantLogo,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}
