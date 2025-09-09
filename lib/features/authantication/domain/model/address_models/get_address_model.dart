class GetAddressModel {
  final String status;
  final List<AddressData> data;
  final bool message;

  GetAddressModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => AddressData.fromJson(e))
          .toList(),
      message: json['message'],
    );
  }
}

class AddressData {
  final String id;
  final String userId;
  final String address;
  final String area;
  final String town;
  final String district;
  final String lat;
  final String lng;
  final String status;
  final String createdAt;
  final String updatedAt;

  AddressData({
    required this.id,
    required this.userId,
    required this.address,
    required this.area,
    required this.town,
    required this.district,
    required this.lat,
    required this.lng,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      address: json['address'] ?? '',
      area: json['area'] ?? '',
      town: json['town'] ?? '',
      district: json['district'] ?? '',
      lat: json['lat'] ?? '',
      lng: json['lng'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
