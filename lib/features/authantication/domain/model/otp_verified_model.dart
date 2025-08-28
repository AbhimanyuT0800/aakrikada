class OtpVerifyModel {
  final String status;
  final String message;
  final UserData data;

  OtpVerifyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) {
    return OtpVerifyModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
  final String id;
  final String? vendorId;
  final String name;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String role;
  final String userimage;
  final String? lat;
  final String? lng;
  final String? district;
  final String? area;
  final String otp;
  final String? subscriptionStatus;
  final String? subscriptionExpiry;
  final String status;
  final String resetKey;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    this.vendorId,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.role,
    required this.userimage,
    this.lat,
    this.lng,
    this.district,
    this.area,
    required this.otp,
    this.subscriptionStatus,
    this.subscriptionExpiry,
    required this.status,
    required this.resetKey,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      vendorId: json['vendor_id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      userimage: json['userimage'] ?? '',
      lat: json['lat']?.toString(),
      lng: json['lng']?.toString(),
      district: json['district'],
      area: json['area'],
      otp: json['otp'] ?? '',
      subscriptionStatus: json['subscription_status'],
      subscriptionExpiry: json['subscription_expiry'],
      status: json['status'] ?? '',
      resetKey: json['reset_key'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
