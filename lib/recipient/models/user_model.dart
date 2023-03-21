import 'dart:convert';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  String id;
  String? profilePictureUrl;
  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.id,
    this.profilePictureUrl,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? id,
    String? profilePictureUrl,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      id: id ?? this.id,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'id': id,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      id: map['id'] as String,
      profilePictureUrl: map['profilePictureUrl'] != null ? map['profilePictureUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phoneNumber: $phoneNumber, id: $id, profilePictureUrl: $profilePictureUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.id == id &&
      other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      id.hashCode ^
      profilePictureUrl.hashCode;
  }
}
