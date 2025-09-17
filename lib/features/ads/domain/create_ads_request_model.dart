import 'dart:convert';
import 'dart:typed_data';

class CreateAdsRequestModel {
  final int userId;
  final List<int> categories;
  final String orderSummary;
  final int itemQty;
  final String priority;
  final int userAddressId;
  final DateTime preferredPickupTime;
  final List<PickupImage> images;

  CreateAdsRequestModel({
    required this.userId,
    required this.categories,
    required this.orderSummary,
    required this.itemQty,
    required this.priority,
    required this.userAddressId,
    required this.preferredPickupTime,
    required this.images,
  });

  factory CreateAdsRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateAdsRequestModel(
      userId: json['user_id'] as int,
      categories: List<int>.from(json['categories'] ?? []),
      orderSummary: json['order_summary'] ?? '',
      itemQty: json['item_qty'] ?? 0,
      priority: json['priority'] ?? '',
      userAddressId: json['user_address_id'] ?? 0,
      preferredPickupTime: DateTime.parse(json['preferred_pickup_time']),
      images: (json['images'] as List<dynamic>? ?? [])
          .map((e) => PickupImage.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "categories": categories,
      "order_summary": orderSummary,
      "item_qty": itemQty,
      "priority": priority,
      "user_address_id": userAddressId,
      // ✅ Keep only seconds, force milliseconds = .000Z
      "preferred_pickup_time": DateTime.utc(
        preferredPickupTime.year,
        preferredPickupTime.month,
        preferredPickupTime.day,
        preferredPickupTime.hour,
        preferredPickupTime.minute,
        preferredPickupTime.second,
      ).toIso8601String(),
      "images": images.map((e) => e.toJson()).toList(),
    };
  }
}

class PickupImage {
  final Uint8List image;

  PickupImage({required this.image});

  factory PickupImage.fromJson(Map<String, dynamic> json) {
    final base64String = json['image'] ?? '';
    return PickupImage(image: base64.decode(base64String.split(',').last));
  }

  Map<String, dynamic> toJson() {
    final base64String = base64Encode(image);
    // ✅ Always include prefix since success body includes it
    return {"image": "data:image/jpeg;base64,$base64String"};
  }
}
