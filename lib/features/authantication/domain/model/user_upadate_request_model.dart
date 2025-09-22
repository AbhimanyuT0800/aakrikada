import 'dart:convert';
import 'dart:typed_data';

class UserUpdateRequestModel {
  final int userId;
  final String name;
  final String email;
  final String userImage;

  UserUpdateRequestModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.userImage,
  });

  factory UserUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateRequestModel(
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      userImage: json['user_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "name": name,
      "email": email,
      "user_image": userImage,
    };
  }
}

class PickupProfileImage {
  final Uint8List image;

  PickupProfileImage({required this.image});

  factory PickupProfileImage.fromJson(Map<String, dynamic> json) {
    final base64String = json['image'] ?? '';
    return PickupProfileImage(
      image: base64.decode(base64String.split(',').last),
    );
  }

  String toJson() {
    final base64String = base64Encode(image);
    return "data:image/jpeg;base64,$base64String";
  }
}
