// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'menu_item_model.dart';

class PublishedMealModel {
  final String id;
  final DateTime createdAt;
  final int quantity;
  final MenuItemModel menuItem;

  PublishedMealModel({
    required this.id,
    required this.createdAt,
    required this.quantity,
    required this.menuItem,
  });

  PublishedMealModel copyWith({
    String? id,
    DateTime? createdAt,
    int? quantity,
    MenuItemModel? menuItem,
  }) {
    return PublishedMealModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
      menuItem: menuItem ?? this.menuItem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'quantity': quantity,
      'menuItem': menuItem.toJson(),
    };
  }

  factory PublishedMealModel.fromMap(Map<String, dynamic> map) {
    return PublishedMealModel(
      id: map['id'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      quantity: map['quantity'] as int,
      menuItem: MenuItemModel.fromJson(map['menuItem'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PublishedMealModel.fromJson(String source) => PublishedMealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublishedMealModel(id: $id, createdAt: $createdAt, quantity: $quantity, menuItem: $menuItem)';
  }

  @override
  bool operator ==(covariant PublishedMealModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.createdAt == createdAt &&
      other.quantity == quantity &&
      other.menuItem == menuItem;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      createdAt.hashCode ^
      quantity.hashCode ^
      menuItem.hashCode;
  }
}
