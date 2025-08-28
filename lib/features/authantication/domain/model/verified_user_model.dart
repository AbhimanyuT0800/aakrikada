class VerifiedUserModel {
  final String status;
  final OtpData data;
  final String message;

  VerifiedUserModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory VerifiedUserModel.fromJson(Map<String, dynamic> json) {
    return VerifiedUserModel(
      status: json['status'] ?? '',
      data: OtpData.fromJson(json['data']),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.toJson(), 'message': message};
  }
}

class OtpData {
  final String otp;
  final String phone;

  OtpData({required this.otp, required this.phone});

  factory OtpData.fromJson(Map<String, dynamic> json) {
    return OtpData(
      otp: json['otp'].toString(),
      phone: json['phone'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'otp': otp, 'phone': phone};
  }
}
