import 'package:intl/intl.dart';

class GetUserAdsModel {
  final String status;
  final List<AdData> data;

  GetUserAdsModel({required this.status, required this.data});

  factory GetUserAdsModel.fromJson(Map<String, dynamic> json) {
    return GetUserAdsModel(
      status: json['status'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => AdData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.map((e) => e.toJson()).toList()};
  }
}

class AdData {
  final String id;
  final String userId;
  final String? vendorId;
  final String? staffId;
  final String categories;
  final String orderSummary;
  final String itemQty;
  final String priority;
  final List<String> images;
  final String userAddressId;
  final String preferredPickupTime; // keep raw string
  final String? quoteAmount;
  final String? actualAmount;
  final String? gst;
  final String? totalAmount;
  final String status;
  final String? pickupDatetime;
  final String? completionDatetime;
  final String createdAt;
  final String updatedAt;
  final String image;

  AdData({
    required this.id,
    required this.userId,
    this.vendorId,
    this.staffId,
    required this.categories,
    required this.orderSummary,
    required this.itemQty,
    required this.priority,
    required this.images,
    required this.userAddressId,
    required this.preferredPickupTime,
    this.quoteAmount,
    this.actualAmount,
    this.gst,
    this.totalAmount,
    required this.status,
    this.pickupDatetime,
    this.completionDatetime,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory AdData.fromJson(Map<String, dynamic> json) {
    return AdData(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      vendorId: json['vendor_id'],
      staffId: json['staff_id'],
      categories: json['categories'] ?? '',
      orderSummary: json['order_summary'] ?? '',
      itemQty: json['item_qty'] ?? '',
      priority: json['priority'] ?? '',
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      userAddressId: json['user_address_id'] ?? '',
      preferredPickupTime: json['preferred_pickup_time'] ?? '',
      quoteAmount: json['quote_amount'],
      actualAmount: json['actual_amount'],
      gst: json['gst'],
      totalAmount: json['total_amount'],
      status: json['status'] ?? '',
      pickupDatetime: json['pickup_datetime'],
      completionDatetime: json['completion_datetime'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      image: json['image'] ?? '',
    );
  }

  ///  Formatted preferred pickup time
  String get formattedPickupTime {
    try {
      final dateTime = DateFormat(
        "yyyy-MM-dd HH:mm:ss",
      ).parse(preferredPickupTime);
      return DateFormat("d MMMM yyyy, hh:mm a").format(dateTime);
    } catch (e) {
      return preferredPickupTime;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'vendor_id': vendorId,
      'staff_id': staffId,
      'categories': categories,
      'order_summary': orderSummary,
      'item_qty': itemQty,
      'priority': priority,
      'images': images,
      'user_address_id': userAddressId,
      'preferred_pickup_time': preferredPickupTime,
      'quote_amount': quoteAmount,
      'actual_amount': actualAmount,
      'gst': gst,
      'total_amount': totalAmount,
      'status': status,
      'pickup_datetime': pickupDatetime,
      'completion_datetime': completionDatetime,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image': image,
    };
  }
}
